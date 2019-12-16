program bai13_trang11;
uses crt;
var A: array [1..50] of longint;
    n,k,d,i,s,min,max: longint;
begin
clrscr;
    repeat
writeln ('co bao nhieu phan tu?'); readln (n);
    until (n>1) and (n<51);
    repeat
for i:= 1 to n do
 begin
   write ('A[',i,']='); readln (A[i]);
   if A[i]=0 then inc(d);
 end;
    until d>1;
writeln ('nhap k'); readln (k);

writeln ('mang:');
for i:= 1 to n do write (A[i],' '); writeln;

i:=1;
while A[i]<>0 do inc(i);
min:=i;
i:=n;
while A[i]<>0 do dec(i);
max:=i;

s:=0; d:=0;
for i:= min to max do
 begin
   s:=s+A[i];
   if A[i] mod k=0 then inc(d);
 end;

writeln ('tong= ',s);
writeln ('co ',d,' so chia het cho k.');

readln
end.