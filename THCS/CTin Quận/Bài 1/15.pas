program bai15;
uses crt;
var a,r1,r2,s: extended;
begin
clrscr;
writeln ('nhap a'); readln (a); writeln;
writeln ('nhap R1'); readln (r1); writeln;
writeln ('nhap R2'); readln (r2); writeln;
writeln ('nhap s'); readln (s); writeln;

if a<>0 then
  begin
    r1:= (a*sqrt(3))/3;
    r2:=r1/2;
    s:= (a*a*sqrt(3))/4;
  end;
if r1<>0 then
  begin
    a:= (r1*3)/sqrt(3);
    r2:=r1/2;
    s:= (a*a*sqrt(3))/4;
  end;
if r2<>0 then
  begin
    r1:=r2*2;
    a:= (r1*3)/sqrt(3);
    s:= (a*a*sqrt(3))/4;
  end;
if s<>0 then
  begin
    a:= sqrt( (s*4)/sqrt(3) );
    r1:= (a*sqrt(3))/3;
    r2:=r1/2;
  end;
writeln (a:1:2,'  ',r1:1:2,'  ',r2:1:2,'  ',s:1:2);
readln
end.