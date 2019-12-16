program  bai16;
uses crt;
var m,n,g,x,y:longint;
begin
writeln ('nhap m,n'); readln (m,n); writeln;
x:=m; y:=n;
 repeat
if (m>n) then m:=m-n else n:=n-m;
 until m=n;
if x>y then writeln ('UCLN(',x,';',y,')= ',m)
       else writeln ('UCLN(',x,';',y,')= ',n);
readln
end.