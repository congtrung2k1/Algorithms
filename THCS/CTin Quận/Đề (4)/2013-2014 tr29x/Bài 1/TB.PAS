program bai1_tr29_4;
var fi,fo: text;
    A: array [1..1000000] of longint;
    n,max,i,min,j,t,d: longint;

BEGIN
assign (fi,'TB.INP'); reset(fi);
assign (fo,'TB.OUT'); rewrite(fo);
read (fi,n);

max:=0;
for i:=1 to n do begin read (fi,A[i]); if A[i]>max then max:=A[i]; end;

min:=1000000000;
for i:=max downto 1 do
  begin
    t:=0;
    for j:=1 to n do inc(t, abs(A[j]-i) );
    if t<min then begin min:=t; d:=i; end;
  end;

writeln (fo,d);

close(fi); close(fo);
END.