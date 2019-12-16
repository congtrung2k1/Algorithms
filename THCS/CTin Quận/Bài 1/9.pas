program  bai9;
uses crt;
var a,n,d,b: longint;
begin
clrscr;
writeln('nhap a,d,b'); readln(a,d,b); writeln;
n:=0;
while a<b do
  begin
    a:=a+d;
    n:=n+1;
  end;
writeln ('n la: ',n,'.gia tri: ',a);
readln
end.