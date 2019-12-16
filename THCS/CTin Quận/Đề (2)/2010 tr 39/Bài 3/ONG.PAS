program bai3_tr39_2;
var fi,fo: text;
    a,b,c: longint;

BEGIN
assign (fi,'ONG.INP'); reset(fi);
assign (fo,'ONG.OUT'); rewrite (fo);
read (fi,a,b,c);

if (c-b) > (b-a) then writeln (fo,c-b-1) else writeln (fo,b-a-1);
close(fi); close(fo);
END.