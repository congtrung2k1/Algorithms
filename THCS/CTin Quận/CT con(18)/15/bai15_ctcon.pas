program bai15_trang20;
uses crt;
type vector= array [0..100] of extended;
var fi,fo:text;
    n,i:byte;
    minA,maxA,tb: extended;
    A:vector;

    procedure MNT(A:vector; n:byte; var minA,maxA,tb: extended);
     var s:extended; i:byte;
     begin
       minA:=A[0]; maxA:=A[0]; s:=0;
       for i:=0 to n do
         begin
          if A[i]>maxA then maxA:=A[i];
          if A[i]<minA then minA:=A[i];
          s:=s+A[i];
         end;
       tb:=s/n;
     end;

begin
assign (fi,'vta.inp'); reset(fi);
assign (fo,'mnt.out'); rewrite(fo);

read(fi,n);
i:=0;
while not(eof(fi)) do
  begin
   read(fi,A[i]);
   inc(i);
  end;

MNT(A,n,minA,maxA,tb);
writeln (fo,minA:1:2);
writeln (fo,maxA:1:2);
writeln (fo,tb:1:2);

close(fi); close(fo);
end.
