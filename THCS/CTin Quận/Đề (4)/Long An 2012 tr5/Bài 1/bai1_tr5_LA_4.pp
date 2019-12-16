program bai1_tr5_LA_2012;
var fi,fo: text;
    m,n,k,ai,bi,x,y,i,d:  longint;
    kt: boolean;
    A: array [0..31,0..31] of boolean;
    B: array [1..100] of record a,b:longint; end;

    procedure thu(y,x:longint; var kt:boolean);
      begin
       if (A[y-1,x]=false) and (A[y-1,x-1]=false) and (A[y-1,x+1]=false)
         and (A[y+1,x]=false) and (A[y+1,x-1]=false) and (A[y+1,x+1]=false)
         and (A[y,x-1]=false) and (A[y,x+1]=false)
        then kt:=false else kt:=true;
      end;

BEGIN
assign (fi,'Bai3.INP'); reset(fi);
assign (fo,'Bai3.OUT'); rewrite(fo);
read (fi,m,n,k);

for i:=1 to k do
  begin
   read (fi,ai,bi);
   A[ai,bi]:=true;
  end;

kt:=true; d:=0;
for y:=1 to m do
 for x:=1 to n do
  if A[y,x]=false then
    begin
     thu(y,x,kt);
     if kt=false then
       begin
        inc(d);
        A[y,x]:=true;
        B[d].a:=y; B[d].b:=x;
       end;
    end;

writeln (fo,d);
for i:=1 to d do
 with B[i] do
  writeln (fo,a,' ',b);

close(fi); close(fo);
END.
