program bai3_tr33_4;
var fi,fo: text;
    A: array [-10000..10000,-10000..10000] of boolean;
    n,mt,my,mx,mz,i,j,d,x,y,t,z: longint;

BEGIN
assign (fi,'XRECT.INP'); reset(fi);
assign (fo,'XRECT.OUT'); rewrite(fo);
read (fi,n);

mt:=-1000000000; my:=-1000000000; mx:=1000000000; mz:=1000000000;
for d:=1 to n do
    begin
      read (fi,x,y,t,z);
      if t>mt then mt:=t; if y>my then my:=y;
      if x<mx then mx:=x; if z<mz then mz:=z;
      for i:=x to t-1 do
        for j:=y-1 downto z do A[i,j]:=true;
    end;

d:=0;
for i:=mx to mt do
  for j:= my downto mz do
    if A[i,j]=true then inc(d);

writeln (fo,d);

close(fi); close(fo);
END.