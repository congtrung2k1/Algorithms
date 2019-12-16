program bai2_tr7_4;
var fi,fo: text;
    n,i,max,kq,gt: longint;

    function doben(n:longint): longint;
      var gt:string;
          tich,so,i:longint;
      begin
       if n<10 then doben:=0 else
           begin
       str(n,gt);  doben:=0;
       while length(gt)>1 do
         begin
           tich:=1;
           for i:= 1 to length(gt) do
             begin
              val(gt[i],so);
              tich:=tich*so;
             end;
           if tich>9 then inc(doben);
           str(tich,gt);
         end;

           end;
      end;

BEGIN
assign (fi,'Persist.inp'); reset(fi);
assign (fo,'Persist.out'); rewrite(fo);
read (fi,n);

max:=0;

for i:=n-1 downto 1 do
  begin
   gt:=doben(i);
   if gt>max then
     begin
      kq:=i;
      max:=gt;
     end;
  end;
writeln(fo,kq);

close(fi); close(fo);
END.
