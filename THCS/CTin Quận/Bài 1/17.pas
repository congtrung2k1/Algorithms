program bai17;
uses crt;
var a,b,c: longint;
begin
writeln ('nhap a,b,c'); readln(a,b,c); writeln;
if (a*a=b*b+c*c) or (b*b=a*a+c*c) or (c*c=a*a+b*b)
      then writeln ('la bo  so Pytago')
      else writeln ('k la bo so Pytago');
readln
end.