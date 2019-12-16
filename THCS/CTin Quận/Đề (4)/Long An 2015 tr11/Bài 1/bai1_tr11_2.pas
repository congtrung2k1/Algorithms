program bai1_tr11_2;
var fi,fo: text;
    d,k,dd,s,dem: longint;

BEGIN
assign (fi,'SOCOLA.INP'); reset(fi);
assign (fo,'SOCOLA.OUT'); rewrite(fo);
read (fi,k);

d:=1;
while d<k do d:=d*2;
dd:=d;

if d-k>0 then
  begin
    s:=0; dem:=0;
    while s<k do
      if (s+dd div 2)<=k then
        begin
         dd:=dd div 2;
         s:=s+dd;
         inc(dem);
        end else begin
                  dd:=dd div 2;
                  inc(dem);
                 end;
    writeln (fo,d,' ',dem);
  end else writeln (fo,d,' ',0);


close(fi); close(fo);
END.