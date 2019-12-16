program bai11_trang10;
uses crt;
var A,B: array [1..100] of longint;
    C: array [1..200] of longint;
    n,o,i,j,g: longint;
begin
clrscr;
randomize;
writeln ('bao nhieu phan tu?'); readln (n);
for i:= 1 to n do A[i]:=random(321)-random(321);
for i:= 1 to n do B[i]:=random(321)-random(321);

writeln ('mang A:');
for i:= 1 to n do writeln (A[i]);
writeln ('mang B:');
for i:= 1 to n do writeln (B[i]);

for i:=1 to n-1 do
 for j:= i to n do
  if A[i]>A[j] then
   begin
    g:=A[i]; A[i]:= A[j]; A[j]:=g;
   end;

for i:=1 to n-1 do
 for j:= i to n do
  if B[i]>B[j] then
   begin
    g:=B[i]; B[i]:=B[j]; B[j]:=g;
   end;

A[n+1]:=321; B[n+1]:=321;
i:=1; j:=1;
for o:= 1 to 2*n do
 if A[i]<B[j] then
  begin
   C[o]:=A[i]; inc(i);
  end         else
  begin
   C[o]:=B[j]; inc(j);
  end;

writeln ('mang C:');
for i:= 1 to o do writeln (C[i]);
readln
end.