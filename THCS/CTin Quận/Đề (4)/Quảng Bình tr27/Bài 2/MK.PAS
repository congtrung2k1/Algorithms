program bai2_tr27_4;
var fi,fo: text;
    a,i,m: longint;       n: string;

BEGIN
assign (fi,'MK.INP'); reset(fi);
assign (fo,'MK.OUT'); rewrite(fo);
read (fi,n);

m:=0;
for i:=1 to length(n) do
  begin
    val(n[i],a);
    inc(m,a);
  end;

writeln (fo,m);

close(fi); close(fo);
END.