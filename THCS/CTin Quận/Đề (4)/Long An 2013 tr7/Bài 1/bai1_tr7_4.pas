program bai2_tr7_4;
var fi,fo: text;
    a,b,c,max,i,j: longint;

BEGIN
assign (fi,'FLOWERS.INP'); reset(fi);
assign (fo,'FLOWERS.OUT'); rewrite(fo);
read (fi,a,b,c);

max:=0;
for i:=0 to (c div a)+1  do
  for j:=0 to (c div b)+1 do
    if (((i*a)+(j*b))<=c) and ((i*a)+(j*b) > max) then max:=(i*a)+(j*b);

writeln(fo,max);

close(fi); close(fo);
END.
