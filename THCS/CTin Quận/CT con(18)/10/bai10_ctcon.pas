program bai10_trang19;
uses crt;
var f1,f2,fo:text;
    A,B: array [1..100] of longint;
    C: array [1..200] of longint;
    n,m,o,i,j,k: longint;

begin
assign (f1,'ord1.dat'); reset (f1);
assign (f2,'ord2.dat'); reset (f2);
assign (fo,'ord.dat'); rewrite (fo);

n:=0; m:=0;
while not(eof(f1)) do
 begin
  inc(n);
  readln(f1,A[n]);
 end;

while not(eof(f2)) do
 begin
  inc(m);
  readln(f2,B[m]);
 end;

o:=n+m;
j:=1; k:=1;
A[n+1]:=2000; B[m+1]:=2000;
for i:=1 to o do
 if (A[j]<B[k]) or (A[j]=B[k]) then
   begin
    C[i]:=A[j];
    inc(j);
   end else begin
             C[i]:=B[k];
             inc(k);
            end;

for i:= 1 to o do writeln (fo,C[i]);

close(f1); close(f2); close(fo);
end.