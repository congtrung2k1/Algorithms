program bai12;
uses  crt;
var xa,ya,xb,yb,xc,yc,xd,yd: longint;
begin
writeln ('nhap xa,ya,xb,yb');
readln (xa,ya,xb,yb);
writeln ('nhap xc,yc,xd,yd');
readln (xc,yc,xd,yd);
if (xa<=xd) and (xc<=xb) and (ya>=yd) and (yc>=yb)
     then writeln ('hai hcn  co diem chung')
     else writeln ('hai hcn k co diem chung');
readln
end.