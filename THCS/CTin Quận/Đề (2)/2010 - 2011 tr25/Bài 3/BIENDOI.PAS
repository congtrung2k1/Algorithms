program bai3_tr25_2;
var fi,fo: text;
    n,i,j,d: longint; chuoi,c: ansistring;

BEGIN
assign (fi,'BIENDOI.INP'); reset(fi);
assign (fo,'BIENDIO.OUT'); rewrite(fo);
read (fi,20);

chuoi:='1';
for i:=1 to n do
  begin
   c:='';
   for j:=1 to length(chuoi) do
     if chuoi[j]='1' then c:=c+'01' else c:=c+'10';
   chuoi:=c;
  end;

d:=0;
for i:=1 to length(chuoi)-1 do
  if chuoi[i]+chuoi[i+1]='00' then inc(d);

writeln(fo,d);
close(fi); close(fo);
END.
