label l1;
var fi,fo: text;
    A: array [0..501,0..501] OF longint;
    C: array [1..200] of longint;
    m,n,k,i,j,kk,d: longint;

BEGIN
assign (fi,'CITY.INP'); reset(fi);
assign (fo,'CITY.OUT'); rewrite(fo);
read  (fi,m,n,k);
for i:=1 to m do
  for j:=1 to n do read (fi,A[i,j]);
for i:=1 to k do read (fi,C[i]);

for kk:=1 to k do
  begin
    d:=0;
    for i:=1 to m do
      for j:=1 to n do
        if A[i-1,j]+A[i-1,j+1]+A[i,j+1]+A[i+1,j+1]+A[i+1,j]+A[i+1,j-1]+A[i,j-1]+A[i-1,j-1]=C[kk] then
           begin writeln (fo,'1 '); inc(d); goto l1; end;
l1: if d=0 then writeln (fo,'0 ');
  end;

close(fo);
END.