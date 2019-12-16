program bai2_2010_2011_tr2;
uses crt;
var fi,fo: text;
    m,n,bcnn: longint;

    function uc(n,m:longint): longint;
      var z: longint;
      begin
        z:=n mod m;
        while z<>0 do
          begin
           n:=m;
           m:=z;
           z:=n mod m;
          end;
        uc:=m;
      end;

begin
assign (fi,'input.dat'); reset (fi);
assign (fo,'output.dat'); rewrite (fo);
read (fi,n,m);
bcnn:= (n*m) div uc(n,m);
writeln(fo,uc(n,m));
writeln(fo,bcnn);
close(fi); close(fo);
end.
