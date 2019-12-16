program bai2_tr33_4;
var fi,fo: text;
    max,n,i,t: longint;
    A: array [1..10000000] of longint;

BEGIN
assign (fi,'NSQUARE.INP'); reset(fi);
assign (fo,'NSQUARE.OUT'); rewrite(FO);
read (fi,n);

max:=0;
while n<>1 do
  begin
    i:=2;
    while n mod i<>0 do inc(i);
    if i>max then max:=i;
    inc(A[i]); n:=n div i;
  end;

t:=1;
for i:=1 to max do
  if A[i] mod 2=1 then  t:=t*i;

writeln (fo,t);
close(fi); close(fo);
END.