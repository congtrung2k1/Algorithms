var fi,fo: text;
    n,k,i,j,MAX,TONG: longint;
    A: array [1..10000000] of longint;

BEGIN
assign (fi,'SEQUENCE.INP'); reset(fi);
assign (fo,'SEQUENCE.OUT'); rewrite(fo);
read (fi,n,k);
for i:=1 to n do read (fi,A[i]);

max:=0;
for i:=1 to n-k+1 do
  begin
    tong:=0;
    for j:=i to i+k-1 do inc (tong,A[j]);
    if tong>max then max:=tong;
  end;

writeln (fo,max);

close(fo);
END.