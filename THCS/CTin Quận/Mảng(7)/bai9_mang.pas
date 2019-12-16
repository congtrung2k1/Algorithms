program bai9_trang7;
uses crt;
var A: array [1..100] of longint;
    n,z,i,dl,db: longint;
begin
clrscr;
randomize;
writeln ('bao nhieu phan tu?'); readln (n);
writeln ('nhap z'); readln (z);
for i:= 1 to n do A[i]:= random(200);
writeln ('mang:');
for i:= 1 to n do writeln (A[i]);

i:=2;
while i<=n do
  begin
   if A[i] mod 2<>0 then inc(dl);
   i:=i+2;
  end;

i:=1;
while i<=1 do
  begin
   if A[i] mod z=0 then inc(db);
   i:=i+2;
  end;

writeln ('so luong phan tu o vi tri chan co gia tri le: ',dl);
writeln ('so luong phan tu o vi tri le la boi cua z: ',db);
readln
end.