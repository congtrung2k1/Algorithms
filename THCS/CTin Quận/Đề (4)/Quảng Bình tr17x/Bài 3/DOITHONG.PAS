program bai3_tr17_4;
var fi,fo: text;
    d,m,n,i,j: longint;
    A: array  [0..1001,0..1001] of longint;

BEGIN
assign (fi,'DOITHONG.INP'); reset (fi);
assign (fo,'DOITHONG.OUT'); rewrite(fo);
read (fi,m,n);

for i:=1 to m do
  for j:=1 to n do A[i,j]:=0;

d:=0;
for i:=1 to m do
  for j:=1 to n do
    if (A[i,j]=1) and (A[i,j-1]=0) and (A[i,j+1]=0) 
                  and (A[i-1,j]=0) and (A[i+1,j]=1) then inc(d);

writeln (fo,d);
close(fi); close(fo);
END.