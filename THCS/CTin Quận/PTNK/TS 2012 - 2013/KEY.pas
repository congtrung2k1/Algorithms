var fi,fo: text;
    n,dmax,i,z,m,d,k,min,max,output: longint;
    A: array [1..10000000] of longint;

BEGIN
assign (fi,'KEY.INP'); reset(fi);
assign (fo,'KEY.OUT'); rewrite(fo);
read (fi,n);

dmax:=0;
for i:=28 to n do
  begin
    m:=i;  d:=0;  k:=1;
    min:=1000000000; max:=0;
    while m<>1 do
      begin
        z:=2;
        while m mod z <>0 do inc (z);  inc(A[z]);  if A[z]=1 then inc(d);
        if z<min then min:=z; if max<z then max:=z;
        M:=m div z;
      end;
    if d>=dmax then
      begin
        output:=i; dmax:=d;
        for z:=min to max do A[z]:=0;
      end;
  end;

writeln (fo,output);
close(fo);
END.