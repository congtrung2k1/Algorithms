program bai2_2010_2011_LA_tr1;
uses crt;
var fi,fo: text;
    A,B: array [1..50] of integer;
    C: array [1..100] of integer;
    n,i,j,k: integer;
begin
assign(fi,'input.dat');reset(fi);
assign(fo,'output.dat'); rewrite(fo);

n:=0;
while not eoln(fi) do
  begin
   inc(n);
   read(fi,A[n]);
  end;
readln(fi);

n:=0;
while not eoln(fi) do
  begin
   inc(n);
   read(fi,B[n]);
  end;

A[n+1]:=1001; B[n+1]:=1001;
j:=1; k:=1;
for i:=1 to 2*n do
 if A[j]<=B[k] then
   begin
    C[i]:=A[j];
    inc(j);
   end else begin
             C[i]:=B[k];
             inc(k);
            end;
for i:=1 to 2*n do write (fo,C[i],' ');

close(fi); close(fo);
end.
