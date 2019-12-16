program bai2_trang7;
uses crt;
type kieu_inte= array [1..99] of longint;
var A: kieu_inte;
    i,d,n,k: longint;
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
for i:= 1 to n do write (A[i],','); writeln;

d:=0;
writeln ('Cac so chan:');
for i:= 1 to n do
  if A[i] mod 2=0 then
   begin
    writeln (A[i]); inc(d);
   end;
writeln ('Co ',d,' so chan');    writeln;

d:=0;
writeln ('Cac so le la:');
for i:= 1 to n do
  if A[i] mod 2<>0 then
   begin
    writeln (A[i]); inc (d);
   end;
writeln ('Co ',d,' so le');     writeln;

d:=0;
writeln ('Cac so nguyen to la:');
for i:= 1 to n do
 if A[i]>1 then
  begin
    k:=2;
    while A[i] mod k <>0 do inc(k);
    if k=A[i] then
      begin
       writeln (A[i]); inc(d);
      end;
  end;
writeln ('co ',d,' so nguyen to.');
readln
end.
