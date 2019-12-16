const FI = 'NGOAC.INP';
      FO = 'NGOAC.OUT';
      maxn = 64;
      maxk = 32;
      maxCount = 50000;
var
  X: string[maxn];
  T, C: array[0..maxn] of Longint;
  Fx, Gx: array[0..maxn, 0..maxk] of Longint;
  n, k, Count: Longint;
  Result: Comp;
  f: Text;

procedure Enter;
var
  f: Text;
begin
  Assign(f, FI); Reset(f);
  Readln(f, n, k);
  Close(f);
end;

procedure Init;
begin
  FillChar(Fx, SizeOf(Fx), 0);
  FillChar(Gx, SizeOf(Gx), 0);
  Fx[0, 0] := 1;
  Gx[0, 0] := 1;
  T[0] := 0;
  C[0] := 0;
  X[0] := Chr(n);
  Assign(f,FI); Rewrite(f);
end;

procedure Destroy;
begin
  Close(f);
end;

procedure Optimize;
var
  i, j, t: Integer;
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
  if (T[i - 1] < k) and (T[i - 1] + 1 <= n - i) then {Mo ngoac}
    begin
      X[i] := '(';
      T[i] := T[i - 1] + 1;
      if C[i - 1] < T[i] then C[i] := T[i]
      else C[i] := C[i - 1];
      Try(i + 1);
      if Count = 0 then Exit;
    end;
  if (T[i - 1] > 0) and
        ((C[i - 1] = k) or (k + k - T[i - 1] + 1 + i <= n))
          then {Dong ngoac}
    begin
      X[i] := ')';
      T[i] := T[i - 1] - 1;
      C[i] := C[i - 1];
      if (i = n) then
        begin
          Writeln(fi, X);
          Dec(Count);
        end
      else
        begin
          Try(i + 1);
          if Count = 0 then Exit;
        end;
    end;
end;

procedure Solve;
begin
  Init;
  Optimize;
  Result := Fx[n, 0] - Gx[n, 0];
  Writeln(f, Result:0:0);
  if Result > maxCount then Count := maxCount
  else Count := Trunc(Result);
  Try(1);
  Destroy;
end;

begin
  Enter;
  Solve;
end.
