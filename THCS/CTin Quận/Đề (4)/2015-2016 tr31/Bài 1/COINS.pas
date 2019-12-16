Program bai1_tr31_4;
var fi,fo: text;
    a,b,c,d,i,j: longint;

BEGIN
assign (fi,'COINS.INP'); RESET(FI);
assign (fo,'COINS.OUT'); rewrite(fo);
read (fi,a,b,c);

d:=0;
for i:=1 to c div a do
  for j:=1 to c div b do
    if (j*b)+(a*i)=c then
      if i+j>d then d:=i+j;
if d=0 then d:=-1;

writeln (fo,d);
close(fi); close(fo);
END.