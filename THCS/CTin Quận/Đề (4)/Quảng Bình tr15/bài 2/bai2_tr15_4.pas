program bai2_tr13_4;
var fi,fo: text;
    i,j,m,n,dem: longint;
    A: array [1..201,1..201] of longint;

BEGIN
assign (fi,'vuon.inp'); reset(fi);
assign (fo,'vuon.out'); rewrite(fo);
read (fi,m,n);

for i:=1 to m do
  for j:= 1 to n do read (fi,A[i,j]);

dem:=0;
for i:=1 to m do
  for j:=1 to n do
    begin
      if j<>n then
        if A[i,j]<>A[i,j+1] then inc(dem);
      if i<>m then
        if A[i,j]<>A[i+1,j] then inc(dem);
    end;

writeln (fo,dem);
close(fi); close(fo);
END.
