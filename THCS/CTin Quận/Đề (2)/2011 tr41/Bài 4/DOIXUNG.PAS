program bai4_tr41_2;
var fi,fo: text;
    gt: int64;
    m,n,x: longint;

BEGIN
assign (fi,'DOIXUNG.INP'); RESET(FI);
assign (fo,'DOIXUNG.OUT'); rewrite(fo);
read (fi,n,m);

if (n mod 2=1) and (m mod 2=1) then
  begin
    x:=0;
    while (n mod 2=1) and (m mod 2=1) and
          (n<>n div 2) and (m <> m div 2) do
      begin
        n:= n div 2;
        m:= m div 2;
        inc (x);
      end;
    n:=1; gt:=1;
    if x>1 then
      for m:=2 to x do
        begin
          gt:=gt*4;
          n:=n+gt;
        end;
  end else n:=0;

writeln (fo,n);

close(fi); close(fo);
END.
