program bai1_tr9_2;
var fi,fo: text;
    n,k,i,d,max: longint;
    A: array [1..100] of longint;

BEGIN
assign (fi,'CHIAHET.INP'); reset(fi);
assign (fo,'CHIAHET.OUT'); rewrite(fo);
read (fi,n,k);

for i:=1 to n do read (fi,A[i]);

d:=0; max:=0;
for i:=1 to n do
 if A[i] mod k =0 then
   begin
    inc (d);
    if d>max then max:=d;
   end else d:=0;

writeln (fo,max);
close(fi); close(fo);
END.
