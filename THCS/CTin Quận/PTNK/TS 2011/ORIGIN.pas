program ORIGIN;
var fi,fo: text;
    m,n,mmax,luu,max,i,s: longint;
    A: array [1..10000] of byte;

BEGIN
assign (fi,'ORIGIN.INP'); reset(fi);
assign (fo,'ORIGIN.OUT'); rewrite(fo);
read(fi,m);

inc(m);   mmax:=0;
while  m>1 do
  begin
    dec(m); n:=m;  max:=0; s:=1;
    while n<>1 do
      begin
        i:=2;
        while n mod i<>0 do inc(i);
        n:=n div i;
        inc (A[i]);   if i> max then max:=i;
      end;
    for i:=1 to max do
      if A[i]>0 then begin s:=s*i; A[i]:=0; end;
    if s> mmax then begin mmax:=s; luu:=m; end;
  end;

writeln(fo,luu);
close(fo);
END.