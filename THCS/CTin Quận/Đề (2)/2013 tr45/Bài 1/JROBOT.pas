program bai1_tr45_2;
var fi,fo: text;
    n,m,pt,i,j,l: longint;
    A: array [1..1000,1..1000] of longint;
    B: array [1..100000000] of longint;

BEGIN
assign (fi,'JROBOT.INP'); reset(fi);
assign (fo,'JROBOT.OUT'); rewrite(fo);
read (fi,n,m);

pt:=0;
for i:=1 to n do
  for j:=1 to m do
    begin
      read (fi,A[i,j]);
      inc(pt);  B[pt]:=A[i,j];
    end;

read (fi,i,j);
l:=A[i,j];

for i:=1 to pt-1 do
  for j:=i+1 to pt do
    if B[i]>B[j] then
      begin
        n:=B[i]; B[i]:=B[j]; B[j]:=n;
      end;

m:=pt; n:=0;
if B[m]>l then
  while B[m]>l do
    begin
      dec(m);
      if B[m]<>B[m+1] then inc(n);
    end;

writeln (fo,n);

close(fi); close(fo);
END.