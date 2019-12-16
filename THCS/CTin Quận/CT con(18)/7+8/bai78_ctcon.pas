program bai78_trang19;
uses crt;
var f1,f2,fo: text;
    procedure docghi(var f2,fo: text);
      var n:integer;
      begin
       while not(eof(f2)) do
        begin
         read(f2,n);
         if (n>=0) and (n<=100) then writeln(fo,n);
        end;
      end;
begin
assign (f1,'nguyen1.txt'); reset (f1);
assign (f2,'nguyen2.txt'); reset (f2);
assign (fo,'nguyen12.txt'); rewrite (fo);
docghi(f1,fo);
docghi(f2,fo);
close(f1); close(f2); close(fo);
end.