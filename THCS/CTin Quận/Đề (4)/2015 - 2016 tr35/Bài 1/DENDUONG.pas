program bai1_tr35_4;
var fi,fo: text;
    A: array [1..1000000] of longint;
    n,i,j,g,max: longint;

BEGIN
assign (fi,'DENDUONG.INP'); reset(fi);
assign (fo,'DENDUONG.OUT'); rewrite (fo);
read (fi,n);

for i:=1 to n do read (fi,A[i]);

for i:=1 to n-1 do
  for j:=i+1 to n do
    if A[i]>A[j] then
      begin
        g:=A[i]; A[i]:=A[j]; A[j]:=g;
      end;

max:=0;
for i:=2 to n do
  if A[i-1]<A[i] then
    if A[i]-A[i-1]>max then max:=A[i]-A[i-1];

writeln (fo,max/2:0:2);

close(fi); close(fo);
END.