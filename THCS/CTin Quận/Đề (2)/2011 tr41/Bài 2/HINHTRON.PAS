program bai2_tr41_2;
var fi,fo: text;
    i,n,dem,j: longint;    d: extended;
    A: array [1..400] of record x,y,r:longint; end;

    procedure tinh(xa,ya,xb,yb:longint);
      begin
       d:=sqrt( sqr(xa-xb) +sqr(ya-yb) );
      end;

BEGIN
assign (fi,'HINHTRON.INP'); reset(fi);
assign (fo,'HINHTRON.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do
  with (A[i]) do
    read (fi,x,y,r);

for i:=1 to n do
  begin
    dem:=0;
    for j:=1 to n do
      if i<>j then
        begin
          tinh(A[i].x,A[i].y,A[j].x,A[j].y);
          if d< (A[i].r+A[j].r) then inc(dem);
        end;
    writeln (fo,dem);
  end;

close(fi); close(fo);
END.