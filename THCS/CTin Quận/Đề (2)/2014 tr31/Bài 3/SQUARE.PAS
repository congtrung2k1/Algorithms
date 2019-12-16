program bai3_tr31_2;
var fi,fo: text;
    n,h,c,d: longint;
    A: array [0..1002,0..1002] of integer;

BEGIN
assign (fi,'SQUARE.INP'); reset(fi);
assign (fo,'SQUARE.OUT'); rewrite(fo);
read (fi,n);

for h:=0 to n+1 do
  for c:=0 to n+1 do A[h,c]:=0;

for h:=1 to n do
  for c:=1 to n do read (fi,A[h,c]);

d:=0;
for h:=1 to n do
  for c:=1 to n do
    if A[h,c]=1 then
      if (A[h-1,c]=0) and (A[h+1,c]=0) and (A[h,c-1]=0) and (A[h,c+1]=0)
        then inc (d);

writeln(fo,d);
close(fi); close(fo);
END.