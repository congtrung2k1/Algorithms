program bai2_tr9_4;
var fi,fo: text;
    n,tong,s,i: longint;
    A: array [1..100] of longint;

BEGIN
assign (fi,'Input.inp'); reset(fi);
assign (fo,'Output.out'); rewrite(fo);
read(fi,n);

tong:=0;
for i:=1 to n do
  begin read(fi,A[i]); tong:=tong+A[i]; end;
tong:=tong div n;


s:=0;
for i:=1 to n do
  if A[i]>tong then s:=s+ A[i]-tong;
if s=0 then writeln(fo,'Khong can di chuyen lan nao') else writeln(fo,s);

close(fi); close(fo);
END.
