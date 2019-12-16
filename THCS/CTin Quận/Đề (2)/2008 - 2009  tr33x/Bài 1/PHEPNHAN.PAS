program bai1_tr33_2;
var fi,fo: text;
    a,b,t: int64;    i,j: longint;
    c,cc: string;

BEGIN
assign (fi,'PHEPNHAN.INP'); reset(fi);
assign (fo,'PHEPNHAN.OUT'); rewrite (fo);
read (fi,a,b);

str(a,c); str(b,cc);

t:=0;
for i:=1 to length (c) do
  for j:=1 to length (cc) do
    begin
      val(c[i],a); val(cc[j],b);
      inc(t, (a*b));
    end;

writeln (fo,t);
close(fi); close(fo);
END.