program bai3_tr23_4;
var fi,fo: text;
    k,t: longint;
    c: string;

BEGIN
assign (fi,'input3.inp'); reset (fi);
assign (fo,'output3.out'); rewrite (fo);
read (fi,k);

c:='';  t:=0;
while k>1 do
   begin
     if k=2 then
       begin
         c:='C1 '+c;
         inc(t,2);
         break;
       end;
     if k mod 2=0 then
       begin
         c:='N2 '+c;
         dec(k,k div 2);
         inc(t,4);
       end else begin
                  c:='C1 '+c;
                  dec(k,1);
                  inc(t,2);
                end;
   end;

writeln (fo,t);
writeln (fo,c);

close(fi); close(fo);
END.