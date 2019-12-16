program bai14;
uses crt;
var r,d,c,s:extended;
begin
writeln ('nhap R'); readln (r);
writeln ('nhap D'); readln (d);
writeln ('nhap C'); readln (c);
writeln ('nhap S'); readln (s);
writeln;

if r<>0 then
 begin
  d:=r*2;
  c:=2*r*pi;
  s:=pi*r*r;
 end;

if d<>0 then
 begin
  r:=d/2;
  c:=2*pi*r;
  s:=pi*r*r;
 end;

if c<>0 then
 begin
  r:=c/2/pi;
  d:=r*2;
  s:=pi*r*r;
 end;

if s<>0 then
 begin
  r:=sqrt(s/pi);
  d:=r*2;
  c:=2*pi*r;
 end;
writeln (r:1:2,'  ',d:1:2,'  ',c:1:2,'  ',s:1:2);
readln
end.