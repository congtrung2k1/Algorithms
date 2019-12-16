program bai6_trang7;
uses crt;
var A: array [1..99] of longint;
    n,i,j,g:longint;  kq: boolean;
begin
clrscr;
writeln ('nhap so luong phan tu'); readln (n); writeln;
for i:=1 to n do
  begin
   write ('A[',i,']='); readln (A[i]);
  end;
for i:= 1 to n do write (A[i],' '); writeln;

i:=2;
while i<=(n-2) do
  begin
    j:=i+2;
    while j<=n do
      begin
       if A[i]>A[j] then
        begin
         g:=A[i]; A[i]:=A[j]; A[j]:=g;
        end;
       inc(j,2);
      end;
    inc(i,2);
  end;

i:=1;
while i<=n-2 do
  begin
    j:=i+2;
    while j<=n do
      begin
       if A[i]>A[j] then
        begin
         g:=A[i]; A[i]:=A[j]; A[j]:=g;
        end;
       inc(j,2);
      end;
    inc(i,2);
  end;

for i:= 1 to n do write (A[i],' '); writeln;
readln
end.