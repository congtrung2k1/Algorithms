program bai1_tr41_2;
var fi,fo: text;
    n,max,i,j,t: longint;
    A: array [1..100000] of longint;

BEGIN
assign (fi,'TONG.INP'); reset(fi);
assign (fo,'TONG.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do read (fi,A[i]);

max:=-1000000000;
for i:=1 to n do
  begin
    t:=0;
    for j:=I to n do
      begin
       inc(t,A[j]);
       if t>max then max:=t;
      end;
  end;

writeln (fo,max);
close(fi); close(fo);
END.
