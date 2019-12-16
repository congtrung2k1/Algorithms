program bai12_2;
uses crt;
var xa,ya,xb,yb,xc,yc,xd,yd: longint;
    i,j: longint;
begin
writeln ('nhap toa do hcn thu nhat');
readln (xa,ya,xb,yb);
writeln ('nhap toa do hcn thu hai');
readln (xc,yc,xd,yd);
for i:= xa to xb do
  if (i=xc) or (i=xd) then break;
if (i=xc) and (i<>xd) or (i=xd) and (i<>xc) then
  begin
    for j:= yb to ya do
      if (j=yd) or (j=yc) then break;
    if (j=yd) and (j<>yc) or (j=yc) and (j<>yd)
      then writeln ('hai hinh chu nhat co diem chung')
      else writeln ('hai hinh chu nhat k co diem chung');
  end;
readln
end.
