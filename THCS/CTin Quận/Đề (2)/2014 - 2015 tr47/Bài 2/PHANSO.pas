program bai2_tr47_2;
var fi,fo: text;
    i,d,gt: longint;  n,t:string;

    function uc(a,b:longint):longint;
      var z:longint;
      begin
        z:=a mod b;
        while z<>0 do
          begin
            a:=b; b:=z;
            z:=a mod b;
          end;
        uc:=b;
      end;

BEGIN
assign (fi,'PHANSO.INP'); reset(fi);
assign (fo,'PHANSO.OUT'); rewrite(fo);
readln (fi,n);
readln (fi,t);

n:=n+t;  val(n,d);
gt:=1;
for i:=1 to length(t) do gt:=gt*10;

writeln (fo, (d div uc(d,gt)),' ',(gt div uc(d,gt)) );
close(fi); close(fo);
END.
