program bai2_trang19;
uses crt;
var a,b: integer;
    c,d:integer;
    fi,fo: text;
    function uc(a,b: integer): integer;
      var r: integer;
      begin
       r:= a mod b;
       while r<>0 do
       begin
         a:=b; b:=r; r:=a mod b;
       end;
       uc:=b;
      end;


begin
assign (fi,'i.dat'); reset(fi);
assign (fo,'o.dat'); rewrite(fo);
read (fi,a,b);
c:= a div uc(a,b);
b:= b div uc(a,b);
write (fo,c,'/',b);
close(fi); close(fo);
end.
