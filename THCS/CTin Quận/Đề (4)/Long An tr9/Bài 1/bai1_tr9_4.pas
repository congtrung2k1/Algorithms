program bai_tr9_4;
var fi,fo: text;
    a,b,c,max,n,m,i,j,tong: longint;
    z,s:array [0..1001] of longint;

BEGIN
assign (fi,'Input.inp'); reset(fi);
assign (fo,'Output.out'); rewrite(fo);
read (fi,n);
for i:=1 to n do read(fi,z[i]);
read(fi,m);

max:=z[1];
s[1]:=z[1];
for i:=2 to n do s[i]:= s[i-1]+z[i];
for i:=1 to n-1 do
  for j:=i+1 to n do
    if ((s[j]-s[i])>max) and (j-i+1=m) then
      begin
       max:=s[j]-s[i];
       a:=i; b:=j;
      end;

for i:=a to b do write (fo,z[i],' ');
close(fi); close(fo);
END.
