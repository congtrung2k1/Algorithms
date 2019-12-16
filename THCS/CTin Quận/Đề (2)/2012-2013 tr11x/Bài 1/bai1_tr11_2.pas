program bai1_tr11_2;
var fi,fo: text;
    m,n,x,y,max: longint;
    A,B: array [1..10000] of longint;

BEGIN
assign (fi,'MAXSUM.INP'); reset(fi);
assign (fo,'MAXSUM.OUT'); rewrite(fo);
readln (fi,m,n);
for x:=1 to m do read(fi,A[x]);
for y:=1 to n do read(fi,B[y]);

max:=0;
for x:=1 to m do
 for y:=1 to n do
  if abs(A[x]+B[y])>max then max:= abs(A[x]+B[y]);

writeln (fo,max);
close(fi); close(fo);
END.