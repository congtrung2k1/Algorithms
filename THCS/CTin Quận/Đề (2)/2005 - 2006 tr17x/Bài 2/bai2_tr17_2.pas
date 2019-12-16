program bai2_tr17_2;
var fi,fo: text;
    A: array [1..10000] of longint;
    B: array [1..10000] of extended;
    n,k,d,i,dinh,pt,dem: longint;

    function dd(xa,ya,xb,yb:longint): longint;
      begin
       dd:= trunc(sqrt( sqr(xa-xb) + sqr(ya-yb) ));
      end;

    function dientich(dinh,pt:longint): extended;
      var vt,i,t: longint; cv:extended;
      begin
       vt:=2; t:=0;
       while vt<pt do
         begin
          inc(vt,2);
          t:=t+dd(A[vt],A[vt-2],A[vt-1],A[vt-3]);
         end;
       cv:= t+dd(A[vt],A[vt-1],A[2],A[1])/2 ;

       dientich:=cv; vt:=2;
       for i:=1 to dinh-1 do
         begin
          inc(vt,2);
          dientich:= dientich * (cv-dd(A[vt],A[vt-2],A[vt-1],A[vt-3]));
         end;
       dientich:= sqrt( dientich * (cv-dd(A[vt],A[2],A[vt-1],A[1])) );
       writeln(dientich:1:2); readln;
      end;

BEGIN
assign (fi,'POLY.INP'); reset (fi);
assign (fo,'POLY.OUT'); rewrite (fo);
read (fi,n,k);

d:=0;
for i:=1 to n do
  begin
     read(fi,dinh);
     for pt:=1 to dinh do read(fi,A[pt]);
     inc(d);
     B[d]:= dientich(dinh,pt);
  end;

dem:=0;
for i:=1 to d do
  if A[i]>A[k] then inc(dem);

writeln(fo,dem);
close(fi); close(fo);
END.