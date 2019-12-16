program bai3_tr27_2;
var fi,fo: text;
    i,n,k,d,tong: longint;

BEGIN
assign (fi,'SOCOLA.IN'); reset(fi);
assign (fo,'SOCOLA.OUT'); rewrite(fo);
read (fi,k);

i:=1;
while i<k do i:=i*2;
n:=i;

if n=k then writeln (fo,n,' ',0) else
  begin
     tong:=0; d:=0;
     while tong<k do
       if tong+(n div 2) <=k then
         begin
          inc(d);
          tong:=tong+(n div 2);
          n:=n div 2;
         end else begin
                   n:=n div 2;
                   inc(d);
                  end;
     writeln (fo,i,' ',d);
  end;
close(fi); close(fo);
END.
