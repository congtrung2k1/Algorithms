program bai3_tr19_2;
var fi,fo:text;
    A: array [0..50001] of record a,b:longint; end;
    kt: boolean;
    n,i,l,dem: longint;

    procedure lonnhat();
      var i:longint;
      begin
       l:=1;
       for i:=1 to n do
         if (A[i].a>A[l].a) and (A[i].b=0) then l:=i;
      end;


BEGIN
assign (fi,'NOMIN.INP'); reset(fi);
assign (fo,'NOMIN.OUT'); rewrite(fo);
read(fi,n);
for i:=1 to n do read (fi,A[i].a);

kt:=false; dem:=0;
while kt=false do
  begin
   lonnhat();inc(dem);
   A[l].b:=1; i:=l;

   while (A[i-1].a<A[i].a) and (i-1>=1) do
     begin
      A[i-1].b:=1;
      dec(i);
     end;
   while (A[l+1].a<A[l].a) and (l+1<=n)do
     begin
      A[l+1].b:=1;
      inc(l);
     end;

   for i:=1 to n do
     if A[i].b=0 then
       begin kt:=false; break end else begin kt:=true; break end;
  end;

writeln(fo,dem);
close(fi); close(fo);
END.