program bai2_tr33_2;
var fi,fo: text;
    gt: extended; i,n,max,t: longint;
    A: array [1..100] of longint;

    procedure ts(vao:longint);
      var i:longint;
      begin
       while vao>1 do
         begin
          i:=2;
          while vao mod i<>0 do inc(i);
          inc(A[i]);
          if i>max then max:=i;
          vao:=vao div i
         end;
      end;

BEGIN
assign (fi,'GIAITHUA.INP'); reset(fi);
assign (fo,'GIAITHUA.OUT'); rewrite(fo);
read (fi,n);

gt:=1.0;  max:=0;  t:=1;
for i:=2 to n do
  begin
    gt:=gt*i;
    ts(i);
  end;


for i:=2 to max do
  if A[i] mod 2<>0 then t:=t*i;

writeln(fo,t);
close(fi); close(fo);
END.
