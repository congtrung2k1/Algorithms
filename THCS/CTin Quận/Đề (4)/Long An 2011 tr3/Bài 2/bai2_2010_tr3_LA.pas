program bai2_2010_tr3_LA;
uses crt;
var fi,fo: text;
    c: string;
    n,m,i,nl: longint;

BEGIN
assign(fi,'file inp.txt'); reset(fi);
assign(fo,'file out.txt'); rewrite(fo);

read(fi,n);
m:=n; nl:=0; c:='';
while m>1 do
  begin
   if m=2 then
     begin
      dec(m);
      inc(nl,2);
      c:='C1 '+c;
      break;
     end;
   if m mod 2=0 then
     begin
      m:=m div 2;
      inc(nl,4);
      c:='N2 '+c;
     end else begin
                   dec(m);
                   inc(nl,2);
                   c:='C1 '+c;
                  end;
  end;
writeln(fo,nl);
write(fo,c);
close(fi); close(fo);
END.
