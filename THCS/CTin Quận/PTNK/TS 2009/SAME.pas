program SAME;
VAR FI,FO: text;
    a,b: string;
    i,j,d,dd: longint;

BEGIN
assign (fi,'SAME.IN'); reset(fi);
assign (fo,'SAME.OUT'); rewrite(fo);
readln(fi,a);
readln(fi,b);

d:=0; dd:=0;
for i:=1 to length(a) do
  if a[i]=b[i] then inc(d) else
    for j:=1 to length(b) do
      if a[i]=b[j] then begin inc(dd); break; end;

writeln (fo,d,' ',dd);
close(fo);
END.