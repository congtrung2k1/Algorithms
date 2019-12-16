program MINSEG;
var fi,fo: text;
    i,n: longint;      t,min:extended;
    A: array [1..10000000] of extended;

BEGIN
assign (fi,'MINSEG.INP'); reset(fi);
assign (fo,'MINSEG.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do read (fi,A[i]);

min:=1000000000;
for i:=1 to n-1 do
  if A[i]>A[i+1] then begin writeln (fo,-1); close(fo); exit; end
  else if A[i]<A[i+1] then begin
                             t:=A[i+1]-A[i];
                             if t<min then min:=t;
                           end;
if min<>1000000000 then write(fo,min:2:2) else write (fo,0);

close(fo);
END.
