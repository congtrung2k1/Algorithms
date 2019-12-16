program bai13;
uses crt;
var i,n,s: longint;
begin
clrscr;
writeln ('nhap n'); readln (n);
s:=0;
while n>0 do
  begin
   i:=n mod 10;
   s:=s+i*i;
   n:=n div 10;
  end;
writeln('tong: ',s);
readln
end.