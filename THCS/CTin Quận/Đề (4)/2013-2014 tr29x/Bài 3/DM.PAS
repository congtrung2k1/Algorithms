program bai3_tr29_4;
var fi,fo: text;
    n,k,i,j,d,dd: longint;
    A: array [1..10000000] of boolean;

BEGIN
assign (fi,'DM.INP'); RESET(FI);
assign (fo,'DM.OUT'); rewrite(fo);
read (fi,n,k);

for i:=1 to k do
  for j:=1 to n do
    if j mod (i+1)=0 then
      if A[j]=false then A[j]:=true else A[j]:=false;

d:=0; dd:=0;
for i:=1 to n do if A[i]=true then inc(d) else inc(dd);
writeln (fo,d);

close(fi); close(fo);
END.