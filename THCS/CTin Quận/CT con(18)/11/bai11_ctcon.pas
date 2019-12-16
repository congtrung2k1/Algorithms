program bai11_trang19;
uses crt;
var fi,fo: text;
    u,v,r,x,y: extended;
    d,d1: longint;
    function tinh(x,y,u,v:extended): extended;
      begin
        tinh:=sqrt( sqr(x-y)+sqr(u-v) );
      end;
begin
assign (fi,'solieu1.txt'); reset (fi);
assign (fo,'solieu2.txt'); rewrite (fo);

read(fi,u,v,r);
d:=0; d1:=0;
while not(eof(fi)) do
  begin
   read(fi,x,y);
   tinh(x,y,u,v);
   if r=tinh(x,y,u,v) then inc(d);
   if r>tinh(x,y,u,v) then inc(d1);
  end;
writeln (fo,'Co ',d,' diem nam tren duong tron');
writeln (fo,'Co ',d1,' diem nam trong duong tron');

close(fi); close(fo);
end.