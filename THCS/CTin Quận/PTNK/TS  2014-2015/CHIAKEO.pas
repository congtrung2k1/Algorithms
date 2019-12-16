program CHIAKEO;
var fi,fo: text;
    n,m,i,min,v: longint;
    A: array [1..100000] of longint;

BEGIN
assign (fi,'CHIAKEO.INP'); reset(fi);
assign (fo,'CHIAKEO.OUT'); rewrite(fo);
read (fi,m,n);

for i:=1 to n do read(fi,A[i]);

while m>0 do
  begin
    min:=100000000; v:=0;
    for i:=1 to n do
      if A[i]<min then begin min:=A[i]; v:=i; end;
    dec(m); inc(A[v]);
  end;

for i:=1 to n do write (fo,A[i],' ');
close(fo);
END.
