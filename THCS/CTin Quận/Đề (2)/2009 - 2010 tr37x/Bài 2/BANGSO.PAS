program bai2_tr37_2;
var fi,fo: text;
    A: array [0..1000,0..1000] of longint;
    m,n,h,c,mh,mc,max,t,i,j: longint;

BEGIN
assign (fi,'BANGSO.INP'); reset(fi);
assign (fo,'BANGSO.OUT'); rewrite(fo);
read (fi,m,n);

for h:=1 to m  do
  for c:=1 to n do read (fi,A[h,c]);

mh:=100000; mc:=1000000; max:=0;
for h:= 1 to m-2 do
  for c:= 1 to n-2 do
    begin
      t:=0;
      for i:=h to h+2 do
        for j:=c to c+2 do inc (t,A[i,j]);
      if t>max then
        begin
         max:=t; mh:=h; mc:=c;
        end else if t=max then
                   if (mh>h) then
                     begin mh:=h; mc:=c; end
                   else if mh=h then if c<=mc then mc:=c;
    end;

writeln (fo,max);
writeln (fo,mh,' ',mc);

close(fi); close(fo);
END.