program bai1_tr19_4;
type bb= record p,g,tt,x:longint; end;
var fi,fo: text;
    A: array [1..6002] of bb;     t:bb;
    n,m,c,q,r,i,j,l: longint;

BEGIN
assign (fi,'BB.inp'); reset(fi);
assign (fo,'BB.out'); rewrite(fo);
read (fi,n,m,c);

for i:=1 to n do
  begin
    read (fi,A[i].p,q,r);
    A[i].g:=r-q;
    A[i].tt:=i;
  end;

for i:=1 to n-1 do
  for j:=i to n do
    if (A[i].g/A[i].p) < (A[i].g/A[i].p) then
      begin
        t:=A[i];
        A[i]:=A[j];
        A[j]:=t;
      end;

i:=0; l:=0;
while (m>0) and (i<n) do
  begin
    inc(i);
    if m div A[i].p>0 then
      begin
        inc (l, (m div A[i].p)*A[i].g );
        A[i].x:=m div A[i].p;
        dec (m, (m div A[i].p)*A[i].p );
      end
  end;

dec(l,c);
writeln (fo,l);
for i:=1 to n do
  if A[i].x<>0 then writeln (fo,A[i].tt,' ',A[i].x);

close(fi); close(fo);
END.
