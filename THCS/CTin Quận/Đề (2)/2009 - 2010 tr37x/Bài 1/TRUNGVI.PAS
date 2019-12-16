program bai1_tr37_2;
var fi,fo: text;
    A,B: array [1..1000] of longint;
    n,vt,i,j: longint;

    procedure sx;
      var  i,j,g: longint;
      begin
       for i:=1 to n-1 do
         for j:=i to n do
           if A[i]>A[j] then
             begin
               g:=A[i]; A[i]:=A[j]; A[j]:=g;
             end;
       inc(vt);
       B[vt]:=A[ (n div 2)+1 ];
      end;

BEGIN
assign (fi,'TRUNGVI.INP'); reset(fi);
assign (fo,'TRUNGVI.OUT'); rewrite(fo);
read (fi,n);

vt:=0;
for i:=1 to n do
  begin
   for j:=1 to n do read (fi,A[j]);
   sx;
  end;
sx;

writeln (fo,B[vt]);
close(fi); close(fo);
END.