program bai2_tr35_2;
var fi,fo: text;
    a,b: string;
    i,j,td,tn: longint;

BEGIN
assign (fi,'SAME.IN'); reset(fi);
assign (fo,'SAME.OUT'); rewrite(fo);
readln (fi,a);
readln (fi,b);

td:=0; tn:=0;
for i:=1 to length(a) do
   if a[i]=b[i] then inc(td)
      else for j:=1 to length(b) do
             if a[i]=b[j] then
               begin
                 inc(tn);
                 break
               end;

writeln (fo,td,'    ',tn);
close(fi); close(fo);
END.