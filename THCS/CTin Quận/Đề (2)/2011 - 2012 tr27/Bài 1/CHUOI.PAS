program bai1_tr27_2;
var fi,fo: text;
    chuoi,c,cc: string;
    i: longint;

BEGIN
assign (fi,'CHUOI.IN'); reset(fi);
assign (fo,'CHUOI.OUT'); rewrite(fo);
read (fi,chuoi);

c:='aoyeui';
cc:='AOYEUI';
for i:=1 to length(c) do
  begin
   while pos(c[i],chuoi)<>0 do
            delete(chuoi,pos(c[i],chuoi),1);
   while pos(cc[i],chuoi)<>0 do
            delete(chuoi,pos(cc[i],chuoi),1);
  end;

for i:=1 to length(chuoi) do
  if ord(chuoi[i]) <=90 then
    begin
     insert( chr(ord(chuoi[i])+32),chuoi,pos(chuoi[i],chuoi) );
     delete( chuoi, pos(chuoi[i+1],chuoi) ,1 );
    end;

i:=1;
while i <= length(chuoi) do
  begin
   insert('.',chuoi,i);
   inc(i,2)
  end;

writeln (fo,chuoi);
close(fi); close(fo);
END.