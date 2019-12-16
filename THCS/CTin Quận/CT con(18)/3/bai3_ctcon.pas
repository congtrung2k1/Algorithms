program bai3_trang19;
uses crt;
var a,b,c: longint;
    fi,fo: text;
    function ss(a,b: longint): longint;
      begin
       ss:=a;
       if b<ss then ss:=b;
      end;

begin
assign (fi,'input.inp'); reset(fi);
assign (fo,'output.out'); rewrite(fo);
read(fi,a,b,c);
writeln(fo,ss(c,ss(a,b)));
close(fi); close(fo);
end.
