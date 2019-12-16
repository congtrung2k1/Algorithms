program bai2_tr25_2;
var fi,fo: text;
    A: array [1..100000] of longint;
    n,i,p: longint;

BEGIN
assign (fi,'MOBIUS.INP'); reset(fi);
assign (fo,'MOBIUS.OUT'); rewrite(fo);
read (fi,n);

if n=1 then writeln(fo,1) else
  begin
    i:=2; p:=0;
    repeat
      while n mod i=0 do
        begin
         inc(p);
         inc(A[i]);
         n:=n div i;
        end;

      if A[i]=2 then
           begin
             writeln(fo,0);
             close(fo);
             exit;
           end;

      inc(i);
    until n=1;

    if p mod 2=0 then writeln(fo,1) else writeln(fo,-1);
   end ;

close (fi); close(fo);
END.
