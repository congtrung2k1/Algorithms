program bai2_tr27_2;
var fi,fo: text;
    n,i,j,min,tt: longint;
    L: array [1..100000] of record a,b,c,d:longint; end;

BEGIN
assign (fi,'LAPTOP.IN'); reset(fi);
assign (fo,'LAPTOP.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do
  with L[i] do
    read (fi,a,b,c,d);

for i:=1 to n-1 do
 for j:=i+1 to n do
   begin
     if (L[i].a>L[j].a) and (L[i].b>L[j].b) and (L[i].c>L[j].c)
         then L[j].d:=1001;
     if (L[i].a<L[j].a) and (L[i].b<L[j].b) and (L[i].c<L[j].c)
         then L[i].d:=1001;
   end;

min:=1001;  tt:=0;
for i:=1 to n do
  if L[i].d<min then
    begin
      min:=L[i].d;
      tt:=i;
    end;

writeln (fo,tt);
close(fi); close(fo);
END.