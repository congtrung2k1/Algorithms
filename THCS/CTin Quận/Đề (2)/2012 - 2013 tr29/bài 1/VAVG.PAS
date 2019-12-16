program bai1_tr29_2;
var fi,fo: text;
    c: char;
    n,qd,tg,i,t,s: longint;
    thuong: extended;

BEGIN
assign (fi,'VAVG.INP'); reset(fi);
assign (fo,'VAVG.OUT'); rewrite(fo);
readln (fi,n);

for i:=1 to n do
  begin
    readln (fi,c,s,t);
    qd:=qd+s;
    tg:=tg+t;
  end;

thuong:=qd/tg;

writeln (fo,thuong:1:2);
close(fi); close(fo);
END.
