program ParallelProgramme;
Uses math;
const
  InputFile  = 'SOFTWARE.INP';
  OutputFile = 'SOFTWARE.OUT';
  maxN = 100;
  maxT = 3000000;
type
  TLine = array[0..maxN * maxT div 16] of Longint;
var
  BestTime, n, Limit: Longint;
  Mask: array[0..15] of Longint;
  p, c: array[1..maxN] of Longint;
  Mark: array[1..maxN] of Boolean;
  Trace: array[1..maxN] of ^TLine;
  fP: array[0..MaxN*MaxT] of Longint;
  {fP(x): Thoi gian toi thieu ma LTV Pascal phai lam trong truong hop LTV C++
                  lam trong x gio}
procedure Enter;
var
  f: Text;
  S1, S2, i: Longint;
begin
  Assign(f, InputFile); Reset(f);
  Readln(f, n);
  for i := 1 to n do Read(f, p[i]);
  S1 := 0; S2 := 0;
  for i := 1 to n do
    begin
      Read(f, c[i]);
    //  if i < n div 2 then S1 := S1 + p[i] else S2 := S2 + c[i];
    end;
  For i:=1 to n do
   If i< n div 2 then s1:=s1+p[i] else s2:=S2+C[i];

  if S1 > S2 then Limit := S1 else Limit := S2; {Greedy Init}
  Close(f);
end;

procedure Init;
var
  i: Integer;
begin
  fP[0] := 0;
  for i := 1 to n do
    begin
      New(Trace[i]);
      FillChar(Trace[i]^, SizeOf(Trace[i]^), 0);
    end;
  for i := 0 to 15 do Mask[i] := Word(1) shl i;
end;

procedure SetBit1(i, j: Longint);
begin
  Trace[i]^[j shr 4] := Trace[i]^[j shr 4] or Mask[j and 15];
end;

function GetBit(i, j: Longint): Boolean;
begin
  GetBit := Trace[i]^[j shr 4] and Mask[j and 15] <> 0;
end;

procedure Optimize;
var
  i, t: Longint;
begin
  (*  fP(t)[i] := min {fP(t)[i - 1] + p[i], fP(t - c[i])[i - 1]}   *)
  for i := 1 to n do
    for t := Limit downto 0 do
      begin
        fP[t] := fP[t] + p[i]; {Viec i do LTV Pascal lam}
        if (t >= c[i]) and (fP[t] > fP[t - c[i]]) then
          begin
            fP[t] := fP[t - c[i]]; {Viec i do LTV C++ lam}
            SetBit1(i, t);
          end;
      end;
end;

procedure Result;
var
  f: Text;
  i, t, m, x, y: Longint;
begin
  BestTime := MaxInt;
  for t := 0 to Limit do
    begin
      if t >= BestTime then Break;
      if t > fP[t] then m := t
      else m := fP[t];
      if BestTime > m then
        begin
          BestTime := m;
          y := t;
        end;
    end;
  x := n;
  FillChar(Mark, SizeOf(Mark), False);
  while (x <> 0) and (y <> 0) do
    begin
      if GetBit(x, y) then
        begin
          Mark[x] := True; {Viec x do LTV C++ lam}
          y := y - c[x];
        end;
      Dec(x);
    end;
  Assign(f, OutputFile); Rewrite(f);
  Writeln(f, BestTime);
  for i := 1 to n do
    if not Mark[i] then Write(f, i, ' ');
  Writeln(f);
  for i := 1 to n do
    if Mark[i] then Write(f, i, ' ');
  Close(f);
end;

begin
  Enter;
  Init;
  Optimize;
  Result;
end.

