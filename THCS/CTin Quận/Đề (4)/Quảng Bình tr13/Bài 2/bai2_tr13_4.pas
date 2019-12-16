program bai2_tr13_4;
var fi,fo: text;
    chuoi: string; i,n,so,tong: longint;

BEGIN
assign (fi,'INPUT.INP'); reset(fi);
assign (fo,'OUTPUT.OUT'); rewrite(fo);
read (fi,n);

str(n,chuoi);       tong:=0;
for i:=1 to length(chuoi) do
  begin
   val(chuoi[i],so);
   case so of
     0,4,6,9: inc(tong,1);
     8: inc(tong,2);
     end;
  end;

writeln (fo,tong);
close(fi); close(fo);
END.