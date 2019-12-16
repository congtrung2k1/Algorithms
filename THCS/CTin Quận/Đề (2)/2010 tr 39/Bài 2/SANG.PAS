program bai2_tr39_2;
label l1;
var fi,fo: text;
    i,d,n,j,k: longint;
    A: array [2..1000] of boolean;

BEGIN
assign (fi,'SANG.INP'); reset(fi);
assign (fo,'SANG.OUT'); rewrite(fo);
read(fi,n,k);

d:=0;

for i:=2 to n do
  for j:=i to n do
      if (j mod i=0) and (A[j]<>true) then
        begin
          A[j]:=true;
          inc(d);
          if d=k then goto l1;
        end;

l1: writeln (fo,j);

close(fi); close(fo);
END.
