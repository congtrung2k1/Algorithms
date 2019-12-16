program bai6;
uses crt;
var A,B,x,y,u,v: longint;
begin
writeln('nhap toa do A(x,y)'); readln(x,y); writeln;
writeln('Nhap toa do B(u,v)'); readln(u,v); writeln;
A:=x*x+y*y;
B:=u*u+v*v;
if A>B then writeln('A') else writeln ('B');
readln
end.
