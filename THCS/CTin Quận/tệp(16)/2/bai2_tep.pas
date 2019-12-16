program bai2_trang17;
var f1,f2,fo: text;
    n: longint;
begin
assign (f1,'TepA.txt'); reset (f1);
assign (f2,'TepB.txt'); reset (f2);
assign (fo,'TepAB.txt'); rewrite (fo);

while not(eof(f1)) do
  begin
   readln(f1,n);
   if (n>-1) and (n<51) then writeln (fo,n);
  end;
while not(eof(f2)) do
  begin
   readln(f2,n);
   if (n>-1) and (n<51) then writeln (fo,n);
  end;

close(f1); close(f2); close(fo);
end.