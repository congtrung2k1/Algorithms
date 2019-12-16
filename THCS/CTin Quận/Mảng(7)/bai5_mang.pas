program bai5_trang7;
uses crt;
var A: array [1..99] of longint;
    n,x,i,j,g,dau,giua,cuoi:longint;  kq: boolean;
begin
clrscr;
writeln ('nhap so luong phan tu'); readln (n); writeln;
for i:=1 to n do
  begin
   write ('A[',i,']='); readln (A[i]);
  end;
writeln ('nhap x'); readln (x); writeln;

for i:= 1 to n-1 do
  for j:= i+1 to n do
     if A[i]> A[j] then
      begin
       g:=A[i]; A[i]:=A[j]; A[j]:=g;
      end;
for i:= 1 to n do writeln (A[i],' ');
writeln;

dau:=1; cuoi:=n; kq:=false;
while (dau<=cuoi) and (kq=false) do
  begin
    giua:=(dau+cuoi) div 2;
    if A[giua]=x then kq:=true else
     if A[giua]>x then
      begin
         cuoi:=giua-1;
         if A[cuoi-1]=x then kq:=true;
      end else
      begin
        dau:=giua+1;
        if A[dau+1]=x then kq:=true;
      end;
  end;
if kq=true then writeln ('tim thay x tai chi so: ',giua)
           else writeln ('khong tim thay x.');
readln
end.