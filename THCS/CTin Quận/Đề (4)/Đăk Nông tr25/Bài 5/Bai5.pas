program bai5tr25_4;
var fi,fo: text;
    n,m,a,i: longint;

    procedure d(a,b:longint);
      var z: longint;
      begin
        z:=a mod b;
        while z<>0 do
          begin
            a:=b; b:=z; z:=a mod b;
          end;
        writeln (fo,b);
      end;

BEGIN
assign (fi,'input.inp'); reset (fi);
assign (fo,'output.out'); rewrite (fo);
read (fi,n,m);

for i:=1 to n-1 do
  begin
    read (fi,a);
    d(a,m);
  end;

close(fi); close(fo);
END.