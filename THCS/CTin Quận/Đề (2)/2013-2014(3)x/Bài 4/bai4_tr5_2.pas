program bai4_tr5_2;
var fi,fo: text;
    t,i,soso,tong,tra,dem: longint;
    chuoi:string[60];

    procedure ngto(nn:longint);
      var i:longint;
      begin
       if nn>1 then
         begin
          i:=2;
          while nn mod i<>0 do inc(i);
          if i=nn then inc(dem);
         end;
      end;


    procedure gop(chuoi:string);
      var so,i:longint;
      begin
       while length(chuoi)>1 do
         begin
          tong:=0;
          for i:=1 to length(chuoi) do
            begin
             val(chuoi[i],so);
             tong:=tong+so;
            end;

          str(tong,chuoi);
         end;
       ngto(tong);
      end;



BEGIN
assign (fi,'CHIAHET6.INP'); reset (fi);
assign (fo,'CHIAHET6.OUT'); rewrite (fo);
readln (fi,t);

dem:=0;
for i:=1 to t do
  begin               writeln(i);
    readln (fi,chuoi);     writeln(chuoi); readln;
    gop(chuoi);
    val( chuoi[length(chuoi)], soso);
    if (tong mod 3=0) and (soso mod 2=0) then tra:=1 else tra:=0;
    writeln (fo,tra,' ',tong);
   end;

writeln (fo,dem);
close(fi); close(fo);
END.
