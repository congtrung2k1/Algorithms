program bai3_tr27_4;
var fi,fo: text;
    A: array [1..320000] of longint;
    n,max,i,b: longint;

BEGIN
assign (fi,'TS.INP'); reset(fi);
assign (fo,'TS.OUT'); rewrite(fo);
read(fi,n);

max:=0;
for i:=1 to n do
  begin
    read (fi,b);
    if b>max then max:=b;
    inc(A[b]);
  end;

for i:=1 to n do
  if A[i]>1 then writeln (fo,i,' ',A[i]);

close(fi); close(fo);
END.