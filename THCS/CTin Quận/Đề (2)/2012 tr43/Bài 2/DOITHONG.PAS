program bai2_tr43_2;
var fi,fo: text;
    m,n,i,j,d: longint;
    C: string;
    A: array [0..100000,0..10000] of char;
    B: array [1..100000] of ansistring;

BEGIN
assign (fi,'DOITHONG.INP'); reset(fi);
assign (fo,'DOITHONG.OUT'); rewrite(fo);

m:=0;   n:=0;
while not eof(fi) do
  begin
    inc(m);
    readln (fi,B[m]);
    if length(B[m]) > n then n:=length(B[m]);
  end;

for i:=1 to m do
  begin
    c:=B[i];
    for j:=1 to length(B[i]) do A[i,j]:=c[j];
  end;

d:=0;
for i:=1 to m do
  for j:=1 to n do
    if (A[i,j]='@') and (A[i,j-1]<>'@') and (A[i,j+1]<>'@')
      and (A[i-1,j]<>'@') and (A[i+1,j]='@') then inc(d);

writeln (fo,d);

close(fo); close(fi);
END.