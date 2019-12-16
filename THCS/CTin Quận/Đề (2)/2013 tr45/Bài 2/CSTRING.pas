program bai2_tr45_2;
var fi,fo: text;
    i,n,c,j: longint;
    s,chuoi: string;

BEGIN
assign (fi,'CSTRING.INP'); reset(fi);
assign (fo,'CSTRING.OUT'); rewrite(fo);
readln (fi,n,c);
readln (fi,s);

for i:=1 to c do
  begin
    chuoi:='';
    for j:= n+1 to length(s) do chuoi:=chuoi+s[j];
    s:=chuoi+s;
  end;

writeln (fo,s);

close(fi); close(fo);
END.