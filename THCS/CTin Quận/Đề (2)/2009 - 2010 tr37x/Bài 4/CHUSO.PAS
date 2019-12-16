program bai4_tr37_2;
var fi,fo: text;
    j,k,r: longint;  i:int64;
    kt: boolean;
    chuoi,c: string;

BEGIN
assign (fi,'CHUSO.INP'); reset(fi);
assign (fo,'CHUSO.OUT'); rewrite(fo);
read (fi,r);

k:=0;   i:=1;
kt:=false;

while kt=false do
  begin
   inc(k);
   i:=i*2;
   str(i,chuoi);
   if r<=length(chuoi) then
             begin
   c:='';
   for j:=length(chuoi) downto length(chuoi)-r+1 do c:=chuoi[j]+c;
   for j:=1 to r do
     if (c[j]<>'1') and (c[j]<>'2') then
       begin
         kt:=false;
         val(c,i);
         break;
       end else kt:=true;
             end;
  end;
writeln (fo,k);

close(fi); close(fo);
END.
