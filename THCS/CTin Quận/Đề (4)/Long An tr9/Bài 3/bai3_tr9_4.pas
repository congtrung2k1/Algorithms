program bai3_tr9_4;
var fi,fo: text;
    chuoi: string;
    i,j,d,max: longint;

BEGIN
assign (fi,'Input.inp'); reset(fi);
assign (fo,'Output.out');
read (fi,chuoi);

max:=0;
for i:=1 to length(chuoi) do
  begin
    d:=1;
    for j:=i+1 to length(chuoi) do
     if chuoi[i]=chuoi[j] then inc(d);
    if d>max then begin max:=d;
                        rewrite (fo);
                        writeln(fo,chuoi[i],' ',max);
                  end;
  end;

close(fi); close(fo);
END.




