program bai8_trang14;
uses crt;
var a,g: string;
    i,j,d: longint;
begin
clrscr;
writeln ('nhap xau a'); readln (a);

g:=a;
for i:= 1 to length(g)-1 do
 for j:= i+1 to length(g) do
  if g[j]=g[i] then g[j]:=' ';
d:=0;
for i:=1 to length(g) do
 if g[i]<>' ' then inc(d);

writeln ('co ',d,' loai ki tu');
for i:= 1 to length(g) do
 if g[i]<>' ' then write (g[i]);
readln
end.
