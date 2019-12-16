const max = 100;
var n,i,j,k: longint;
    A: array [0..max] of string;
    x: array [0..max] of longint;

BEGIN
  writeln('Bai 6');
  write ('Nhap n: '); readln(n);
  k:=2;

  for i:=1 to n do readln(A[i]);
  for i:=1 to k do x[i]:=i;

  repeat
    writeln;  for i:=1 to k do writeln(A[x[i]]);
    while (i>0) and (x[i] = n-k+i) do dec(i);
    if i>0 then
      begin
        inc(x[i]);
        for j:=i+1 to k do x[j]:=x[j-1]+1;
      end;
  until i=0;

readln
END.