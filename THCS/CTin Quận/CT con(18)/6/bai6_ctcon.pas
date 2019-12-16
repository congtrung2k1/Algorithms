program bai6_trang19;
uses crt;
var fi,fo: text;
    n: int64;
    function sumdigit(n:int64): longint;
      var i: integer;
      begin
       sumdigit:=0;
       while n>0 do
        begin
         i:=n mod 10;
         sumdigit:=sumdigit+i;
         n:=n div 10;
        end;
      end;
begin
assign (fi,'input.dat'); reset(fi);
assign (fo,'output.dat'); rewrite(fo);
read(fi,n);
write (fo,sumdigit(n));
close(fi); close(fo);
end.