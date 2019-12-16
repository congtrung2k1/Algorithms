program bai1_tr43_2;
var fi,fo: text;
    n,m,i,j,g,max,d: longint;
    A: array [0..1000] of longint;

BEGIN
assign (fi,'DINHGIA.IN'); reset(fi);
assign (fo,'DINHGIA.OUT'); rewrite(fo);
read (fi,n,m);
for i:=1 to m do read (fi,A[i]);

for i:=1 to m-1 do
  for j:=i+1 to m do
    if A[i]<A[j] then
      begin
        g:=A[i];
        A[i]:=A[j];
        A[j]:=g;
      end;

max:=0;
if m>n then m:=n else n:=m;
for i:= 1 to m do
  if (A[i]*i > max) then
   begin
      max:=A[i]*i;
      d:=A[i];
    end;

writeln (fo,d,' ',max);
close(fi); close(fo);
END.
