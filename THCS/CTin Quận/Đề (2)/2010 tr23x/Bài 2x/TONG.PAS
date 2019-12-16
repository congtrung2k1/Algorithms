program bai2_tr23_2;
var fi,fo: text;
    n,k,a,b,d: longint;


BEGIN
assign (fi,'TONG.INP'); reset(fi);
assign (fo,'TONG.OUT'); rewrite(fo);
read (fi,n);

inc(n); k:=n-1;
while n>0 do
  begin
    dec(n);
    a:=0; b:=n;
    while a<=b do
      begin
        if a+b=n then writeln (a,'+',b,'+',k-n); readln;
        dec(b); inc(a);
      end;
  end;

writeln(fo,d);
close(fi); close(fo);
END.