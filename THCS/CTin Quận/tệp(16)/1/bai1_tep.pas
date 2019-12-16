program bai1_trang16;
var r1,r2,r3,t1,t2,t3,t4,t5: extended;
    a,b: text;
begin
assign (a,'resist.inp');
assign (b,'resist.out');
reset(a);
rewrite (b);
while not(eof(a)) do
  begin
    readln(a,r1,r2,r3);
    t1:=(r1+r2+r3);
    t2:=r1+(r2*r3)/(r2+r3);
    t3:=r2+(r1*r3)/(r1+r3);
    t4:=r3+(r1*r2)/(r1+r2);
    t5:=(r1*r2*r3)/(r1*r2+r2*r3+r1*r3);
    writeln (b, t1:8:2, t2:8:2, t3:8:2, t4:8:2, t5:8:2);

  end;
close(a);
close(b);
end.