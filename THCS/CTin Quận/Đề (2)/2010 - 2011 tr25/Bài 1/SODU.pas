program bai1_tr25_2;
var fi,fo: text;
    A: array [0..41] of longint;
    i,vao,z,d: longint;

BEGIN
assign (fi,'SODU.INP'); reset(fi);
assign (fo,'SODU.OUT'); rewrite(fo);

d:=0;
for i:=1 to 10 do
  begin
    read (fi,vao);
    z:= vao mod 42;
    if A[z]=0 then inc(d);
    inc(A[z]);
  end;

writeln(fo,d);
close(fi); close(fo);
END.