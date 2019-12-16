program bai1_tr39_2;
var fi,fo: text;
    day,month,thu,sn,i,cl: longint;

BEGIN
assign (fi,'NGAY.INP'); reset(fi);
assign (fo,'NGAY.OUT'); rewrite(fo);
read (fi,day,month);
thu:=1;

if (day=1) and (month=1) then writeln (fo,6)
   else if (day=2) and (month=1) then writeln (fo,7) else begin


sn:=0;
for  i:=1 to month-1 do
  case i of
    1,3,5,7,8,10,12: inc(sn,31);
    2: begin
         if 2010 mod 4 =0 then inc(sn,29) else inc(sn,28);
       end;
    else inc(sn,30);
    end;
sn:=sn-3+day;

thu:=thu+(sn mod 7); //writeln (sn mod 7); readln;


{}                                                          end;

writeln (fo,thu);

close(fi); close(fo);
END.
