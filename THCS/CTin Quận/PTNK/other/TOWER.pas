program TOWER;
var fi,fo: text;
    a,b,min,v,i,d,tong:longint;

    function fun(c,b,a:longint): longint;
      var i:longint;
      begin
        for i:=c+1 to b-1 do
          if (c mod i=0) and (i mod b=0)then
            begin
              inc(d) ; inc(tong,i);
              fun(i,b,c);
            end;
        for i:=c-1 downto a+1 do
          if (c mod i=0) and (i mod a=0) then
            begin
              inc(d); inc(tong,i);
              fun(i,c,a);
            end;
      end;

BEGIN
assign (fi,'TOWER.INP'); reset(fi);
assign (fo,'TOWER.OUT'); rewrite(fo);
read (fi,a,b);

min:=1000000000;   v:=0;
if (a<0) or (b<0) or (b mod a<>0) then begin writeln (fo,'-1'); close(fo); exit; end else
  for i:=b-1 downto a+1 do
    if (b mod i=0) and (i mod a=0) then
      begin
        d:=3; tong:=a+b+i;
        fun(i,b,a);
        if min>tong then begin min:=tong; v:=d; end;
      end;
writeln (fo,v,' ',min);
close(fo);
END.
