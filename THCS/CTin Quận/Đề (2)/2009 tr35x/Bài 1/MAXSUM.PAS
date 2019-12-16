program bai1_tr35_2;
var fi,fo: text;
    m,n,max,i,j: longint;
    A,B: array [1..10000] of longint;

BEGIN
assign (fi,'MAXSUM.IN'); reset(fi);
assign (fo,'MAXSUM.OUT'); rewrite(fo);
read (fi,m,n);

max:=0;
for i:=1 to m do read (fi,A[i]);
for i:=1 to n do read (fi,B[i]);

for i:=1 to m do
  for j:=1 to n do
    if abs(A[i]+B[j]) > max then max:=abs(A[i]+B[j]);

writeln (fo,max);
close(fi); close(fo);
END.