{$MODE OBJFPC}
const
  InputFile  = 'mld.INP';
  OutputFile = 'mld.OUT';
  max = 2000;
  vocuc=100000;

type
  TCapacities = array[1..max, 1..max] of Integer;
var
  c: TCapacities;
  a,b: array [1..max] of record x,y:integer end;
  f: TCapacities;
  Trace: array[1..max] of Integer;
  n, s, t, x, d: Integer;
  fo: text;

procedure Enter;
var
  m, i, u, v, j, x: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(c, SizeOf(c), 0);
  ReadLn(fi, m, n, d);
  For i:=1 to m do begin readln(fi,u,v,x);
                         c[u+1,v+1]:=c[u+1,v+1]+x;
                         c[v+1,u+1]:=c[u+1,v+1]  end;
  s:=1;
  t:=n;
  Close(fi);
end;

procedure Enter1;
var
  m, i, u, v, j: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(c, SizeOf(c), 0);
  ReadLn(fi, m, n, d);
  inc(n);
  s:=1; t:=n;
  For i:=1 to n do
   begin
   c[i,n+i]:=1;
   c[n+i,i]:=1;
   end;
  For i:=1 to m do
   begin
   Readln(F,u,v);
   Inc(u); inc(v);
   c[n+u,v]:=1;
   End;
  n:=n*2-1;
  Close(fi);
end;

function FindPath: Boolean; {Tim duong tang luong tren Gf bang BFS, tra ve True neu tim thay}
var
  u, v: Integer;
  Queue: array[1..max] of Integer;
  Front, Rear: Integer;
begin
  FillChar(Trace, SizeOf(Trace), 0);
  Front := 1; Rear := 1;
  Queue[1] := s;
  Trace[s] := n + 1; {Trace[v] = 0 <=> v chua tham}
  repeat
    u := Queue[Front]; Inc(Front);
    for v := 1 to n do {Xet cac dinh v chua tham ke u tren Gf}
      if (Trace[v] = 0) and (c[u, v] > f[u, v]) then //Xet cac cung (u,v) chua bao hoa, cf=c[u,v]-f[u,v]>0
        begin
          Trace[v] := u;
          if v = t then {Den duoc t thi thuat toan dung}
            begin
              FindPath := True; Exit;
            end;
          Inc(Rear); Queue[Rear] := v;
        end;
  until Front > Rear;
  FindPath := False;
end;

procedure IncFlow; {Tang luong f doc duong tang luong P}
var
  Delta, u, v: Integer;
begin
  {Tinh Delta = ΔP}
  Delta := MaxInt;
  v := t; {Duyet duong tang luong P tu dinh t den dinh s}
  repeat
    u := Trace[v]; //Xet cung (u,v) tren duong di P, voi u la dinh tham truoc v
    if c[u, v] - f[u, v] < Delta then Delta := c[u, v] - f[u, v]; //Tim gia tri cf[u,v] nho nhat
    v := u;
  until v = s;
  {Tang luong f}
  v := t; {Duyet duong tang luong P tu dinh t den dinh s}
  repeat
    u := Trace[v]; //Xet cung (u,v) tren duong di P, voi u la dinh tham truoc v
    f[u, v] := f[u, v] + Delta;
    f[v, u] := f[v, u] - Delta;
    v := u;
  until v = s;
end;

procedure PrintResult;
var
  u, v: Integer;
  m: Integer;
begin

  m := 0;
  for u := 1 to n do
    for v := 1 to n do
      if f[u, v] > 0 then {Chi quan tam den nhung cung co luong duong}
        begin
          if u = s then m := m + f[s, v];
        end;
  WriteLn(fo,m);

end;

begin
  Assign(fo, OutputFile); Rewrite(fo);
  Enter;
  FillChar(f, SizeOf(f), 0); //Khoi tao luong 0
  repeat
    if not FindPath then Break; //Thoat neu khong tim thay duong tang luong
    IncFlow; //Thuc hien tang luong f
  until False;
  PrintResult; //In ket qua
  Enter1;
  FillChar(f, SizeOf(f), 0); //Khoi tao luong 0
  repeat
    if not FindPath then Break; //Thoat neu khong tim thay duong tang luong
    IncFlow; //Thuc hien tang luong f
  until False;
  PrintResult;
  Close(fo);
end.
