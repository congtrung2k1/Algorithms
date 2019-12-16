program bai2_tr25_4;
var fo: text;
    i: longint;

    procedure tinh(vao:longint);
      var i,a,b,e,d:longint; c:string;
      begin
        str(vao,c);
        val(c[1],a); val(c[2],b); val(c[3],d); val(c[4],e);
        i:=a*a*a*a+b*b*b*b+d*d*d*d+e*e*e*e;
        if i=vao then writeln (fo,i);
      end;

BEGIN
assign (fo,'bai2.out'); rewrite(fo);

for i:= 1000 to 9999 do tinh(i);

close(fo);
END.