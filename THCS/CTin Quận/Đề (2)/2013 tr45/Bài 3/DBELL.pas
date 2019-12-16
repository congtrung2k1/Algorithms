program bai3_tr45_2;
var fi,fo: text;
    w,n,i,j,g,min,d,dem,t,tong: longint;
    A: array [1..10] of longint;

    procedure gg;
      begin
        while (t+20<=w) and (t<w) do
          begin
           inc(dem); inc(t,20);
          end;
        if t=w then exit;

        while (t+15<=w) and (t<w) do
          begin
           inc(dem); inc(t,15);
          end;
        if t=w then exit;

        while (t+10<=w) and (t<w) do
          begin
           inc(dem); inc(t,10);
          end;
        if t=w then exit;

        while (t+5<=w) and (t<w) do
          begin
           inc(dem); inc(t,5);
          end;
        if t=w then exit;

        while (t+2<=w) and (t<w) do
          begin
           inc(dem); inc(t,2);
          end;
        if t=w then exit;

        while (t+1<=w) and (t<w) do
          begin
           inc(dem); inc(t,1);
          end;
        if t=w then exit;
      end;

BEGIN
assign (fi,'DBELL.INP'); reset(FI);
assign (fo,'DBELL.OUT'); rewrite(fo);
read (fi,n);     tong:=0;
for i:=n downto 1 do begin read (fi,A[i]);  inc(tong,A[i]); end;
read (fi,w);


min :=1000000000;  d:=0;
if w=tong then min:=0
  else if tong<w then
         begin
          t:=tong; dem:=0; gg;
          inc(dem,d); if dem<min then min:=dem;
         end else
       if tong>w then
         for i:=1 to n do
           begin
             dem:=0;
             dec(tong,A[i]); inc(d);  t:=tong;
             gg;
             inc(dem,d); if dem<min then min:=dem;
           end;

writeln(fo,min);
close(fi); close(fo);
END.
