program bai5_trang19;
uses crt;
var n:qword;
    fi,fo: text;
    function gt(n:qword): extended;
      var i:longint;
      begin
       gt:=1;
       if n=0 then gt:=1;
       if n>0 then
        for i:=1 to n do gt:=i*gt;
      end;
begin
assign(fi,'input.inp'); reset(fi);
assign(fo,'output.out'); rewrite(fo);

while not(eof(fi)) do
 begin
  read(fi,n); writeln(fo,n,'!=',gt(n):1:1);
 end;
close(fi); close(fo);
end.
