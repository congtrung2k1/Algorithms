const max = 100;

var i,j,k,n: longint;
    A: array [0..max] of longint;
    T: array [0..max] of string;

BEGIN
  writeln('Bai 4');
  write ('Nhap n: '); readln(n);
  write ('Nhap k: '); readln(k);

  for i:=1 to n do readln(T[i]);
  for i:=1 to k do A[i]:=i;

  repeat
    writeln ('{');
    for i:=1 to k do writeln(T[A[i]]);
    writeln ('}'); writeln;

    i:=k;
    while (i>0) and (A[i] = n-k+i) do dec(i);
    if (i>0) then
      begin
        inc(A[i]);
        for j:=i+1 to k do A[j]:=A[j-1]+1;
      end;
  until i=0;

readln;
END.
