var fi,fo: text;
    nN: array [1..100000] of record a,b: longint; end;
    mM: array [1..100000] of longint;
    n,m,i,j,d,dem: longint;

BEGIN
assign (fi,'LINE.INP'); reset(fi);
assign (fo,'LINE.OUT'); rewrite(fo);
read (fi,n,m);

for i:=1 to n do read (fi,nN[i].a,nN[i].b);
for i:=1 to m do read (fi,mM[i]);
dem:=0;
for i:=1 to n do
  begin
    d:=0;
    for j:=1 to m do
      if (nN[i].a<mM[j]) and (mM[j]<nN[i].B) then begin inc(d); if d=2 then break; end;
   if d=2 then inc (dem);
  end;

writeln (fo,dem);

close(fo);
END.