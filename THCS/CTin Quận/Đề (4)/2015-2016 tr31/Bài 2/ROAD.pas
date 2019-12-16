program bai2_tr31_4;
var fi,fo: text;
    n,k,v,i,j,l,t,u: longint;
    A: array [1..100000000] of longint;

BEGIN
assign (fi,'ROAD.INP'); reset(fi);
assign (fo,'ROAD.OUT'); rewrite(fo);
read (fi,n,k);

for i:=1 to n do read (fi,A[i]);

v:=0;
for i:=1 to n do
  for j:=i to n do
    begin
      t:=0;
      for l:=i to j do inc(t,A[l]);
      if (t mod (j-i+1)=0) and (t div (j-i+1)=k) then
        if j-i+1>v then begin u:=i; v:=j-i+1; end;
    end;

writeln (fo,u,' ',v);

close(fi); close(fo);
END.