program bai4_trang17;
var fi,fo: text;
    A: array [1..10000] of longint;
    n,i,g,k,d,max :longint;
begin
assign (fi,'sub.inp'); reset (fi);
assign (fo,'sub.out'); rewrite (fo);

read (fi,n,k);
d:=0; max:=0;
for i:=1 to n do
 begin
  read (fi,A[i]);
  if  A[i] mod k=0 then
    begin
      inc(d);
      max:=d;
    end else d:=0;
 end;

writeln (fo,max);

close(fi); close (fo);
end.
