program bai1_tr41_2;
var fi,fo: text;
    n,d,max,i,j,sum: longint;
    A: array [1..100000] of longint;

BEGIN
assign (fi,'TONG.INP'); reset(fi);
assign (fo,'TONG.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do read (fi,A[i]);

d:=0; max:=-1000000000;
while d<n do
  begin
    inc(d);	//dem so luong
    for i:=1 to n do
      begin
        sum:=0;
        for j:=i to i+d-1 do inc(sum,A[j]);
        if sum>max then max:=sum;
      end;
  end;

writeln (fo,max);
close(fi); close(fo);
END.