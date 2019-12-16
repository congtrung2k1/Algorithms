program bai2_tr9_2;
type mang = array [0..50] of extended;
var fi,fo: text;
    A: mang;
    i,n: longint; x:extended;


    function giatri(A:mang; n:longint; x:extended): extended;
      var i:longint; gt:extended;
      begin
       gt:=1; giatri:=0;
       for i:=1 to n do gt:=gt*x;
       for i:=n downto 0 do
         begin
           giatri:=giatri + A[i]*gt;
           gt:=gt/x;
         end;
      end;


BEGIN
assign (fi,'GIATRI.INP'); reset(fi);
assign (fo,'GIATRI.OUT'); rewrite(fo);
read (fi,n,x);
for i:= 0 to n do read(fi,A[i]);

writeln (fo,giatri(A,n,x):1:3);

close(fi); close(fo);
END.
