program bai7_trang7;
uses crt;
var A: array [1..99] of longint;
    n,i,k,dd,da,s:longint;
begin
clrscr;
randomize;
writeln ('nhap so luong phan tu'); readln (n); writeln;
for i:=1 to n do
  begin
   A[i]:=random(300)-random(300)
  end;
writeln ('nhap k'); readln (k); writeln;

for i:= 1 to n do write (A[i],' '); writeln;

writeln ('cac phan tu la boi cua k la: ');
s:=0;
for i:= 1 to n do
 begin
  if A[i] mod k=0 then
    begin
      s:=s+A[i]; write (A[i],' ');
    end;
  if A[i]>=0 then inc(dd) else inc(da);
 end;
writeln ('tong cac so boi cua k la: ',s);
writeln ('so cac so duong: ',dd,'. So cac so am: ',da);
readln
end.

