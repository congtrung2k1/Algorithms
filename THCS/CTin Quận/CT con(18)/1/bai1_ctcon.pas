program bai1_trang19;
uses crt;
var cd,cr: integer;
    a,b: text;
    procedure hcn(cd,cr: integer);
      var i: integer;
      begin
       for i:=1 to cd do write (b,'*');
       writeln(b);
       for i:=1 to cr-2 do
        begin
         write(b,'*','*':cd-1);
         writeln(b);
        end;
       for i:=1 to cd do write (b,'*');
      end;

begin
assign (a,'input.dat'); reset (a);
assign (b,'output.dat'); rewrite(b);
while not eof(a) do
 begin
  read (a,cd,cr);
  hcn(cd,cr);
  writeln (b);
 end;
close(a); close(b);
end.
