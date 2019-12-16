program bai3_tr3_LA_2011;
var fi,fo: text;
    sang,n,i,ti: longint;
    A:  array [1..100] of longint;

    function boi(a,b: longint): longint;
      var t,r: longint;
      begin
       t:=a*b;
       r:=a mod b;
       while r<>0 do
         begin
          a:=b;
          b:=r;
          r:=a mod b;
         end;
       boi:=t div b;
      end;

BEGIN
assign (fi, 'Bai1.INP'); reset(fi);
assign (fo, 'Bai1.OUT'); rewrite(fo);

read (fi,n);
for i:=1 to n do
  begin
   read (fi,ti);
   A[i]:=ti;
  end;

sang:= boi(A[1],A[2]);
for i:=3 to n do sang:= boi(sang,A[i]);
write (fo,sang);

close(fi); close (fo);
END.
