program bai13_trang19;
uses crt;
var fi,fo: text;
    k,n: longint;
    function sumdigit(n:integer): longint;
      begin
       sumdigit:=0;
       while n<>0 do
         begin
          sumdigit:=sumdigit+ (n mod 10);
          n:=n div 10;
         end;
      end;

begin
assign (fi,'digit.inp'); reset(fi);
assign (fo,'digit.out'); rewrite(fo);


read(fi,k);
if k<1 then
 begin
  write(fo,0);
  exit;
 end;

while not(eof(fi)) do
 begin
  readln(fi,n);
  writeln (fo,sumdigit(n));
 end;

close(fi); close(fo);
end.