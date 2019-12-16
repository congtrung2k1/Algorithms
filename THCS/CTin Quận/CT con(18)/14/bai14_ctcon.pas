program bai14_trang20;
uses crt;
type vector=array [0..50] of real;
var fi,fo:text;
    n: byte;
    x,mx:extended;
    i:integer;
    A: vector;
    function poly(A:vector; n:byte; x:real; mx: extended): extended;
      var s: extended;
          i: integer;
      begin
       s:=0;
       for i:= 0 to n do
        begin
         s:=s+ A[i]*mx;
         mx:=mx/x;
        end;
       poly:=s;
      end;

begin
assign (fi,'poly.inp'); reset(fi);
assign (fo,'poly.out'); rewrite(fo);

read(fi,n,x);
i:=0;
while not(eof(fi)) do
  begin
   read(fi,A[i]);
   inc(i);
  end;

mx:=x;
for i:=2 to n do mx:=mx*x;
write (fo,poly(A,n,x,mx):1:3);


close(fi); close(fo);
end.
