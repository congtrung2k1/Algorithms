program bai12_trang12;
uses crt;
var fi,fo: text;
    k,n: longint;
    function gt(n:longint): extended;
      var i:longint;
      begin
       gt:=1;
       if n=0 then
        begin
         gt:=1;
         exit;
        end;
       if n>0 then
         for i:=1 to n do gt:=i*gt;
      end;

begin
assign (fi,'gt.inp'); reset (fi);
assign (fo,'gt.out'); rewrite (fo);
read(fi,k);

while not(eof(fi)) do
  begin
   read(fi,n);
   write (fo,n,'!=');
   writeln (fo,gt(n):1:0);
  end;

close(fi); close(fo);
end.