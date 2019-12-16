program bai3_tr7_4;
type lap=record a,b,c,d:longint; end;
     mang=array [1..100] of lap;
var fi,fo: text;
    i,n,j,min,luu: longint;
    A: mang;

BEGIN
assign (fi,'LAPTOP.INP'); reset(fi);
assign (fo,'LAPTOP.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do
  with A[i] do
    read (fi,a,b,c,d);

for i:=1 to n-1 do
 for j:=i+1 to n do
  if (A[i].a>A[j].a) and (A[i].b>A[j].b) and (A[i].c>A[j].c)
                then A[j].d:=1000
     else if (A[i].a<A[j].a) and (A[i].b<A[j].b) and (A[i].c<A[j].c)
                then A[i].d:=1000;
min:=A[1].d;  luu:=1;
for i:=2 to n do
  if A[i].d<min then
    begin
     min:=A[i].d;
     luu:=i;
    end;

writeln(fo,luu);
close(fi); close(fo);
END.
