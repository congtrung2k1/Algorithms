program MAXSUM;
var fi,fo: text;
    i,j,m,n,max: longint;
    A,B: array [1..100000] of longint;

BEGIN   readln;
assign (fi,'MAXSUM.IN'); reset(fi);
assign (fo,'MAXSUM.OUT'); rewrite(fo);
read(fi,m,n);
for i:=1 to m do read (fi,A[i]);
for i:=1 to n do read (fi,B[i]);

max:=0;
for i:=1 to m do
  for j:=1 to  n do
    if abs(A[i]+B[j])>max then max:=abs(A[i]+B[j]);

writeln (fo,max);
close(fo);
END.
