program bai3_tr23_2;
var fi,fo: text;
    nguoi,i,j,xa,xb,ya,yb,dem: longint;
    A: array [0..10000,0..10000] of longint;

BEGIN
assign (fi,'LAMVUON.INP'); reset(fi);
assign (fo,'LAMVUON.OUT'); rewrite(fo);

for nguoi:=1 to 3 do
  begin
    read (fi,xa,ya,xb,yb);
    for i:= yb-1 downto ya do
      for j:= xa to xb-1 do inc(A[i,j]);
  end;

dem:=0;
for i:=ya to yb-1 do
 for j:= xa to xb-1 do
  if A[i,j]=3 then inc(dem);

writeln(fo,dem);
close(fi); close(fo);
END.
