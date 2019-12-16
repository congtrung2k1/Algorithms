program bai2_tr21_4;
var fi,fo: text;
    A: array [1..100000] of longint;
    n,m,i,j,dem,lop,max: longint;


BEGIN
assign (fi,'class.in'); reset(fi);
assign (fo,'class.ou'); rewrite(fo);
read (fi,n);

max:=1; lop:=0;
for i:=1 to n do
  begin
   dem:=0;
   read (fi,m);
   for j:=1 to m do
    if m mod j=0  then inc(dem);
   if dem>max then max:=dem;
   if A[dem]=0 then inc(lop);
   inc(A[dem]);
  end;

writeln (fo,lop);
for i:=1 to max do
  if A[i]<>0 then writeln (fo,i,' ',A[i]);

close(fi); close(fo);
END.