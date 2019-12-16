program bai1_tr13_4;
var fi,fo:text;
    D,V: array [1..100000] of longint;
    n,m,i,cs,tong,c,max: longint;

BEGIN
assign (fi,'P2.INP'); reset(fi);
assign (fo,'P2.OUT'); rewrite(fo);
read (fi,n,m);

for i:=1 to n do read (fi,D[i]);
for i:=1 to m do read (fi,V[i]);

c:=m;
while c>n do
  begin
   max:=0; cs:=0;
   for i:=1 to m do
     if V[i]>max then begin max:= V[i]; cs:=i; end;
   V[cs]:=0;
   dec(c);
  end;

tong:=0; cs:=0;
for i:=1 to m do
 if V[i]>0 then
   begin
    inc(cs);
    tong:= tong+ V[i]*D[cs];
   end;

writeln(fo,tong);
for i:=1 to m do
 if V[i]<>0 then writeln (fo,i);

close (fi); close(fo);
END.