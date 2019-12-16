program bai3_tr13_4;
var fi,fo: text;
    n,t,m: longint;

BEGIN
assign (fi,'input.inp'); reset(fi);
assign (fo,'output.out'); rewrite(fo);
read (fi,n);  m:=n;

t:=0;
while n>1 do
  begin
    inc(t);
    if n mod 2=0 then n:=n div 2 else dec(n);
  end;

if m=0 then writeln(fo,0);
if m=1 then writeln (fo,1);
if m>1 then writeln(fo,t+1);

close(fi); close(fo);
END.