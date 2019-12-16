program bai2_tr13_2;
var  fi,fo: text;
     n,i,gt: longint;
     x,lt,s: extended;

BEGIN
assign (fi,'GIATRI.INP'); reset (fi);
assign (fo,'GIATRI.OUT'); rewrite (fo);
read (fi,x,n);

lt:=1;
for i:=1 to n do lt:=lt*x;

gt:=1;
for i:=1 to n do
  begin
    gt:=gt*i;
    lt:=lt/x;
    s:=s+ lt/gt;
  end;

writeln (fo,s:1:3);

close(fi); close(fo);
END.