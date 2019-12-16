program bai1_tr3_LA_2011;
uses crt;
var fi,fo: text;
    i,j,d,max: integer;
    A: array [1..100] of integer;
BEGIN
assign(fi,'DAYSO.INP'); reset(fi);
assign(fo,'DAYCON.OUT'); rewrite(fo);

i:=0; d:=1; max:=0;
while not eof(fi) do
  begin
   inc(i);
   read(fi,A[i]);
  end;

for j:=1 to i-1 do
 if A[j]=A[j+1] then
   begin
    inc(d);
    if d>max then max:=d;
   end else d:=1;
writeln(fo,max);
close(fi); close(fo);
END.