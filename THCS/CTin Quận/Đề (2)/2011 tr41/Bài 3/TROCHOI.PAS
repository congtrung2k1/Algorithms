program bai3_tr41_2;
var fi,fo: text;
    A: array [1..1000] of boolean;
    i,b,j,n: longint;

BEGIN
assign (fi,'TROCHOI.INP'); reset(fi);
assign (fo,'TROCHOI.OUT'); rewrite(fo);
read (fi,n);

i:=1; b:=1; A[i]:=true;
while 1+1=2 do
  begin
    i:=i+b;
    if i>n then dec (i,n); 
    if A[i]=true then
      begin
        writeln (fo,b);
        close(fo);
        exit;
      end else begin
                 b:=i;
                 A[b]:=true;
               end;
  end;

close(fi); close(fo);
END.
