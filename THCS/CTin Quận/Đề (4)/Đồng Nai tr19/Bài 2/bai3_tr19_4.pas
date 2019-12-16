program bai2_tr19_4;
var fi,fo: text;
    A: array [1..100] of record a,b:longint; end;
    n,i,j,d: longint;


BEGIN
assign (fi,'PD.INP'); reset(fi);
assign (fo,'PD.OUT'); rewrite(fo);
read (fi,n);

for  i:=1 to n do
  with A[i] do read (fi,a,b);

d:=0;
for i:=1 to n-1 do
  for j:=1 to n do
    if (A[i].a>A[j].a) and (A[i].b<A[j].b) then inc(d)
      else if (A[i].a<A[j].a) and (A[i].b>A[j].b) then inc(d);

writeln (fo,d);
close(fi); close(fo);
END.