const max = 100;
var A: array [0..max] of longint;
    n: longint;

procedure xuat(k: longint);
var j: longint;
begin
  for j:=1 to k do write(A[j]:3);
  writeln
end;

procedure try(k: longint);
var x,i: longint;
begin
  xuat(k);
  x:=A[k];
  for i:=A[k-1] to x div 2 do
    begin
      A[k]:=i;
      A[k+1]:=x-i;
      try(k+1);
    end;
end;

BEGIN
  write ('Nhap n: '); readln(n);
  A[0]:=1;
  A[1]:=n;
  try(1);
  readln;
END.
