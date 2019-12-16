program bai3_trang17;
var A,B: array[1..100] of longint;
    C: array [1..200] of longint;
    f1,f2,fo: text;
    m,n,i,o,j,k: longint;
begin
assign(f1,'ord1.dat');
assign(f2,'ord2.dat');
assign(fo,'ord.dat');
reset (f1); reset(f2); rewrite(fo);

m:=0; n:=0;
while not(eof(f1)) do
  begin
   inc(m);
   readln(f1,A[m]);
  end;
while not(eof(f2)) do
  begin
   inc(n);
   readln(f2,B[n]);
  end;
A[m+1]:=101;
B[n+1]:=101;

o:=m+n;
j:=1; k:=1;
for i:=1 to o do
 if (A[j]<B[k]) or (A[j]=B[k])then
   begin
    C[i]:=A[j];
    inc(j);
   end else
   begin
    C[i]:=B[k];
    inc(k);
   end;
for i:= 1 to o do writeln (fo,C[i]);

close(f1); close(f2); close(fo);
end.
