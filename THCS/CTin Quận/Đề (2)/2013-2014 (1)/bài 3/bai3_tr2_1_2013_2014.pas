program bai3_tr2_1_2013_2014;
uses crt;
var fi,fo: text;
    n,m,r,j: longint; s,c: string;
    A: array [1..100] of byte; kq: boolean;

    function kt(s: string):boolean;
      var d1,d0,i:longint;
      begin
       d1:=0; d0:=0;
       for i:=1 to length(s) do
         begin
          if s[i]='0' then inc(d0) else inc(d1);
         end;
       if d1=d0 then kt:=true else kt:=false;

      end;

BEGIN
assign (fi,'NPDX.INP'); reset(fi);
assign (fo,'NPDX.OUT'); rewrite(fo);
read(fi,n);

kq:=false;
while kq=false do
  begin
   inc(n);
   m:=n;
   s:='';
   while m>0 do
     begin
      r:=m mod 2; str(r,c);
      s:=c+s;
      m:=m div 2;
     end;
   if kt(s)=true then kq:=true else kq:=false;
  end;
writeln(fo,n);
write(fo,s);
close(fi); close(fo);
END.