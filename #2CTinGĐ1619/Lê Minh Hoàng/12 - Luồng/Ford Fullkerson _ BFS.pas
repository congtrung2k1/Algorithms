{Tim luong cuc dai bang thuat toan Ford Fullkerson voi ky thuat BFS, ap dung DON DO THI CO HUONG
- con goi la thuat toan Edmonds-Karp}
{$MODE OBJFPC}
const
  InputFile  = 'MAXFLOW.INP';
  OutputFile = 'MAXFLOW.OUT';
  max = 1000;
type
  TCapacities = array[1..max, 1..max] of Integer;
var
  c: TCapacities;
  f: TCapacities;
  Trace: array[1..max] of Integer;
  n, s, t: Integer;

procedure Enter;
var
  m, i, u, v: Integer;
  fi: Text;
begin
  Assign(fi, InputFile); Reset(fi);
  FillChar(c, SizeOf(c), 0);
  ReadLn(fi, n, m, s, t);
  for i := 1 to m do
    ReadLn(fi, u, v, c[u, v]);
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
  fo: Text;
begin
  Assign(fo, OutputFile); Rewrite(fo);
  m := 0;
  for u := 1 to n do
    for v := 1 to n do
      if f[u, v] > 0 then {Chi quan tam den nhung cung co luong duong}
        begin
          WriteLn(fo, 'f[', u, ', ', v, '] = ', f[u, v]);
          if u = s then m := m + f[s, v];
        end;
  WriteLn(fo, 'Max Flow: ', m);
  Close(fo);
end;

begin
  Enter;
  FillChar(f, SizeOf(f), 0); //Khoi tao luong 0
  repeat
    if not FindPath then Break; //Thoat neu khong tim thay duong tang luong
    IncFlow; //Thuc hien tang luong f
  until False;
  PrintResult; //In ket qua
end.
