program bai3_tr3_2;

var fi,fo: text;
    n,m,x,iC: longint;
    c,xx: ansistring;
    kt: boolean;

BEGIN
assign (fi,'NPCS.INP'); reset(fi);
assign (fo,'NPCS.OUT'); rewrite(fo);
read(fi,n);

kt:=false;
while kt=false do
  begin
    inc(n);
    m:=n;  c:=''; iC:=0;

    while m>0 do
      begin
       x:=m mod 2;
       if (iC=0) and (x=0) then
         begin
          iC:=1;
          str(x,xx);
          c:=xx+c;
         end else
                  if (iC=1) and (x=1) then
                    begin
                     iC:=0;
                     str(x,xx);
                     c:=xx+c;
                    end else break;
       m:=m div 2;
      end;
    if (m=0) and (c[1]='1') then kt:=true;
  end;

writeln (fo,n);
close(fi); close(fo);
END.