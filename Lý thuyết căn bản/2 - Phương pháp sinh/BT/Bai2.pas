const max = 100;
var i,j,k,n: longint;
    A: array [0..max] of longint;

BEGIN
  writeln('Bai 2');
  write ('Nhap n : '); readln(n);
  write ('Nhap k : '); readln(k);

  for i:=1 to k do A[i]:=1;

  repeat
    write ('{');
    for i:=1 to k-1 do write(A[i],',');
    writeln(A[k],'}');

    i:=k;
    while (i>0) and (A[i]>=n) do dec(i);
    if i>0 then
      begin
        inc(A[i]);
        for j:=i+1 to k do A[j]:=1;
      end;
  until i=0;

readln
END.