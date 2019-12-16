program bai1_tr31_2;
var fi,fo: text;
    i,n,t,a,z: longint;

BEGIN
assign (fi,'ONE.INP'); reset(fi);
assign (fo,'ONE.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do
  begin
    read (fi,a);
    t:=0;
    while a>0 do
      begin
       z:=a mod 2;
       if z=1 then inc(t);
       a:=a div 2;
      end;
    writeln (fo,t);
  end;

close(fi); close(fo);
END.
