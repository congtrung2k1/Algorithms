program bai16_trang21;
uses crt;
type mang=array [1..100] of longint;
var fi,fo: text;
    A: mang;
    n,k,i,max,d: longint;

begin
assign (fi,'subseq.inp'); reset(fi);
assign (fo,'subseq.out'); rewrite(fo);

read (fi,n,k);
for i:=1 to n do read (fi,A[i]);

d:=0; max:=0;
for i:=1 to n do
 if k mod A[i]=0 then
   begin
    inc(d);
    if d>max then max:=d;
   end else d:=0;

write(fo,max);
close(fi); close(fo);
end.