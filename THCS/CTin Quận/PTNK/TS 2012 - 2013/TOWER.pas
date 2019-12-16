type bang = record a,b,c,g: longint; end;
var fi,fo: text;
    A: array [1..100] of bang; z: bang;
    i,j,max,n,tong: longint;

BEGIN
assign (fi,'TOWER.INP'); reset(fi);
assign (fo,'TOWER.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do
  with A[i] do begin read(fi,a,b,g); c:=a*b; end;
for i:=1 to n-1 do
  for j:=i+1 to n do
    if A[i].c<A[j].c then begin z:=A[i]; A[i]:=A[j]; A[j]:=z; end;

max:=0;
for i:=1 to n-1 do
  begin
    tong:=A[i].g;
    for j:=i+1 to n do
      if (A[i].a>=A[j].a) and (A[i].b>=A[j].b) or (A[i].a>=A[j].b) and (A[i].b>=A[j].a)
        then inc(tong,A[j].g);
    if tong>max then max:=tong;
  end;

writeln (fo,max);
close(fo);
END.
