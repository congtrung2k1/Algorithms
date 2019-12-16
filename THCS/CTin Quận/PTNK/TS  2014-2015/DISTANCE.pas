program KHOANGCACH;
var fi,fo: text;
    a,b: ansistring;
    i,j: longint;

BEGIN
assign (fi,'DISTANCE.INP'); reset(fi);
assign (fo,'DISTANCE.OUT'); rewrite(fo);
readln (fi,a); readln (fi,b);

for i:= length (a) downto 1 do
  for j:= length(b) downto 1 do
    if a[i]=b[j] then begin delete (a,i,1); delete (b,j,1); break; end;

writeln (fo,length(a)+length(b));
close(fo);
END.