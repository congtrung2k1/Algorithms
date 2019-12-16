program bai1_tr13_2;
var fi,fo: text;
    m,n,x,y,t,dem: longint;
    A,B: array [1..10000] of longint;

    function kt(n:longint): boolean;
      var i: longint;
      begin
        if n<2 then kt:=false else
          begin
           i:=2;
           while n mod i<>0 do inc(i);
           if i=n then kt:=true else kt:=false;
          end
      end;



BEGIN
assign (fi,'TONGNT.INP'); reset(fi);
assign (fo,'TONGNT.OUT'); rewrite(fo);
readln(fi,m,n);

while not eoln(fi) do
  for x:=1 to m do read (fi,A[x]); readln(fi);
while not eoln(fi) do
  for y:=1 to n do read (fi,B[y]);

dem:=0;
for x:=1 to m do
 for y:=1 to n do
   begin
     t:=A[x]+B[y];
     if kt(abs(t))=true then inc(dem);
   end;

writeln (fo,dem);

close(fi); close(fo);
END.