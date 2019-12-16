program bai2_tr31_2;
var fi,fo: text;
    A: array [0..11] of longint;
    i,n,B: longint;


BEGIN
assign (fi,'DIF.INP'); reset(fi);
assign (fo,'DIF.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do
  begin
    read (fi,b);
    inc (A[b]);
  end;

b:=0;
for i:=0 to 11 do
  if A[i]=1 then inc (b);

writeln (fo,b);
close(fi); close(fo);
END.