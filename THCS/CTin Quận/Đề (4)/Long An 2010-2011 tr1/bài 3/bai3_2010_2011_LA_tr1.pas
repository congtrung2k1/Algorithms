program bai3_2010_2011_LA_tr1;
uses crt;
var fi,fo: text;
    s,s1: string;
    i,n,tong,code: longint;
begin
assign (fi,'input.dat'); reset(fi);
assign (fo,'output.dat'); rewrite(fo);

read(fi,s);
tong:=0; s1:='';
for i:=1 to length(s) do
   begin
    val(s[i],n,code);
    if code=0 then tong:=tong+n else s1:=s1+s[i];
   end;
writeln(fo,'S1= ',s1);
writeln(fo,'Tong= ',tong);

close(fi); close(fo);
end.