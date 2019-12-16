program bai3_tr13_2;
var fi,fo: text;
    n,i,x,y: longint;  tong: extended;

    function uc(m,n:longint):longint;
      var z: longint;
      begin
       z:=m mod n;
       while z<>0 do
         begin
          m:=n;
          n:=z;
          z:=m mod n;
         end;
       uc:=n;
       tong:=tong+(x*y)/(uc*uc);
      end;


BEGIN
assign (fi,'HINHVUONG.INP'); reset (fi);
assign (fo,'HINHVUONG.OUT'); rewrite(fo);
read (fi,n);

tong:=0;
for i:=1 to n do
  begin
    read (fi,x,y);
    writeln (fo,uc(x,y) );
  end;

writeln(fo,tong:1:0);

close(fi); close(fo);
END.