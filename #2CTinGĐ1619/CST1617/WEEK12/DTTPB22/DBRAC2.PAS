const FI = 'DBRAC2.INP';
      FO = 'DBRAC2.OUT';
      maxn = 66;
      maxk = 33;
      maxCount = 10000;
var X: string;
    T, C: array[0..maxn] of Longint;
    Fx, Gx: array[0..maxn, 0..maxk] of int64;
    n, k, Count: Longint;
    f,g: Text;

procedure Init;
begin
  FillChar(Fx, SizeOf(Fx), 0);
  FillChar(Gx, SizeOf(Gx), 0);
  Fx[0, 0] := 1;
  Gx[0, 0] := 1;
  T[0] := 0;
  C[0] := 0;
  X[0] := Chr(n);
end;

procedure Optimize;
var i, j, t: Integer;
begin
  t := k - 1;
  for i := 1 to n do
    for j := 0 to k do
      begin
        if j > 0 then
          begin
            Fx[i, j] := Fx[i - 1, j - 1];
            Gx[i, j] := Gx[i - 1, j - 1];
          end;
        if j < k then Fx[i, j] := Fx[i, j] + Fx[i - 1, j + 1];
        if j < t then Gx[i, j] := Gx[i, j] + Gx[i - 1, j + 1];
      end;
end;

procedure Try(i: Byte);
begin
  if (T[i - 1] < k) and (T[i - 1] + 1 <= n - i) then
    begin
      X[i] := '(';
      T[i] := T[i - 1] + 1;
      if C[i - 1] < T[i] then C[i] := T[i] else C[i] := C[i - 1];
      Try(i + 1);
      if Count = 0 then Exit;
    end;
  if (T[i - 1] > 0) and
        ((C[i - 1] = k) or (k + k - T[i - 1] + 1 + i <= n))
          then
    begin
      X[i] := ')';
      T[i] := T[i - 1] - 1;
      C[i] := C[i - 1];
      if (i = n) then
        begin
          Writeln(g, X);
          Dec(Count);
        end
      else
        begin
          Try(i + 1);
          if Count = 0 then Exit;
        end;
    end;
end;

procedure Enter;
 Var Ans: Int64;
begin
  Assign(f,FI); Reset(f);
  Assign(g,FO); Rewrite(G);
  While not eof(F) do
   Begin
   Readln(f, n, k);
   N:=N*2;
   Init; Optimize;
   Ans:=Fx[n,0]-Gx[n,0];
   Writeln(g,Ans);
   End;
  if Ans>maxCount then Count := maxCount
  else Count:=Ans;
  Try(1);
  Close(G); Close(f);
end;


begin
  Enter;
end.
