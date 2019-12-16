program bai2_tr11_4;
var fi,fo: text;
    c,ch: string; i:integer;


BEGIN
assign (fi,'input.inp'); reset(fi);
assign (fo,'output.out'); rewrite(fo);
read(fi,c);

i:=0;
while i<length(c)-1 do
  begin
   inc(i);
   ch:=c[i]+c[i];
   while pos(ch,c)<>0 do delete (c,pos(ch,c),1);
  end;

writeln(fo,c);

close(fi); close(fo);
END.