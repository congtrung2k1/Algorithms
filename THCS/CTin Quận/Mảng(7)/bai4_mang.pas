program bai4_trang7;
uses crt;
var A: array [1..99] of longint;
    i,x,n,d: longint;
begin
clrscr;
  repeat
writeln ('nhap so phan tu'); readln (n); writeln;
  until n<99;
writeln ('nhap phan tu');
for i:= 1 to n do
  begin
    write ('A[',i,']= '); readln (A[i]);
  end;
writeln ('nhap x'); readln(x); readln;

writeln ('Cac phan tu cua mang la:');
for i:= 1 to n do writeln (A[i]);

d:=0;
write ('x xuat hien o cac vi tri: ');
for i:= 1 to n do
 if A[i]=x then
   begin
     d:=d+1; write (i,'  ');
   end;
writeln;
writeln ('Co ',d,' lan x xuat hien.');
readln
end.