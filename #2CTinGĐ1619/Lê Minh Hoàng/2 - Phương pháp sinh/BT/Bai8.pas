const max = 10000;
var A: array[0..max] of longint;
    n,i,j,k: longint;

function check:boolean;
var i:longint; b:array[1..10000] of longint;
begin
    fillchar(b,sizeof(b),0);
    for i:=1 to k do
      if b[a[i]] = 0 then inc(b[a[i]])
      else exit(false);
    exit(true);
end;

BEGIN
  writeln('Bai 8');
  write ('Nhap n: '); readln(n);
  write ('Nhap k: '); readln(k);

  for i:=1 to k do A[i]:=1;

  repeat
    if check then
      begin
        writeln;
        for i:=1 to k do write(A[i], #32);
      end;
    i:=k;
    while (i>0) and (A[i] >= n) do dec(i);
    if i>0 then
      begin
        inc(A[i]);
        for j:= i+1 to k do A[j]:=1;
      end;
  until i=0;

  readln;
END.

