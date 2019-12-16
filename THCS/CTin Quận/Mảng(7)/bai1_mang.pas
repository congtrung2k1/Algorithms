program bai1_trang7;
uses crt;
var A: array [1..99] of longint;
    i,j,n,m,g,cs: longint;
begin
clrscr;
writeln ('nhap so phan tu'); readln (n); writeln;
writeln ('nhap phan tu');
for i:= 1 to n do
  begin
    write ('A[',i,']= '); readln (A[i]);
  end;
writeln;

writeln ('Cac phan tu cua mang la:');
for i:= 1 to n do writeln (A[i]); writeln;

m:=0;
for i:= 1 to n do
  if m<A[i] then
   begin
    m:=A[i]; cs:=i;
   end;
writeln ('so lon nhat la:',m,'.Chi so: ',cs);

writeln ('mang da xep la:');
for i:= 1 to n-1 do
  for j:= i to n do
   if A[i]>A[j] then
    begin
     g:=A[i]; A[i]:=A[j]; A[j]:=g;
    end;
for i:= 1 to n do writeln (A[i]); writeln;

readln
end.
