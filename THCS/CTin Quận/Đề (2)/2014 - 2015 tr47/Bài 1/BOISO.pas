program bai1_tr47_2;
var fi,fo: text;
    a,b,t,d,i:longint; c:string;

BEGIN
assign (fi,'BOISO.INP'); reset(fi);
assign (fo,'BOISO.OUT'); rewrite(fo);
read (fi,c);

d:=0;
for i:=1 to length(c)-2 do
  begin
    val(c[i],a);  val(c[i+1],t); val(c[i+2],b);
    if (a+b=t) and ((a*100+t*10+b)mod 11=0) then inc(d);
  end;

writeln (fo,d);

close(fi); close(fo);
END.