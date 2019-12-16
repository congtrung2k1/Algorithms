program BASE;
var fi,fo: text;
    n,m,i: longint;
    A: array [1..100000] of longint;

BEGIN
assign (fi,'BASE.INP'); reset(fI);
assign (fo,'BASE.OUT'); rewrite(fo);
read (fi,n);  m:=n;
for i:=1 to n do read(fi,A[i]);

for i:=2 to  n-1 do
  if (A[i]<A[i+1]) and (A[i]<A[i-1]) then
    begin A[i]:=0; dec(m); end;

writeln (fo,m);
for i:=1 to n do
  begin if A[i]<>0 then write (fo,A[i],' '); end;

close(fo);
ENd.