program bai3_tr15_4;
var fi,fo: text;
    n,i,d,max: longint;
    A: array [1..100000] of longint;

BEGIN
assign (fi,'DAYSO.INP'); reset(fi);
assign (fo,'DAYSO.OUT'); rewrite(fo);

n:=0;
while not eof(fi) do
  begin
     inc(n);
     read (fi,A[n]);
  end;

max:=0;  d:=1;
for i:=1 to n do
    if A[i]=A[i+1] then
      begin
       inc(d);
       if d>max then max:=d;
      end else d:=1;

writeln (fo,max);
close(fi); close(fo);
END.
