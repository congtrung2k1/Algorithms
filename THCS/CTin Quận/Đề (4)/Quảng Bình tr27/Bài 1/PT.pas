program bai1_tr27_4;
var fi,fo: text;
    n,m,i: longint;
    A: array [1..100] of longint;

    procedure d(a,b:longint);
      var z:longint;
      begin
        z:=a mod b;
        while z<>0 do
          begin
            a:=b; b:=z; z:=a mod b;
          end;
        m:=b;
      end;

BEGIN
assign (fi,'PT.INP'); reset(fi);
assign (fo,'PT.OUT'); rewrite(fo);
read (fi,n);

for i:=1 to n do read (fi,A[i]);

m:=A[1];
for i:=2 to n do
  begin
   d(A[i],m);
   if m=1 then break;
  end;

writeln (fo,m);
close(fi); close(fo);
END.