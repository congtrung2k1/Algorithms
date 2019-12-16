program bai10_trang10;
uses crt;
var A,B,C: array [1..100] of longint;
    n,i,j,d: longint;
begin
clrscr;
writeln ('bao nhieu phan tu?'); readln (n);
for i:= 1 to n do
  begin
   write ('A[',i,']=');  readln (A[i]);
  end;

for i:= 1 to n do
  begin
   write ('B[',i,']='); readln (B[i]);
  end;

writeln ('mang A:');
for i:= 1 to n do writeln (A[i]);
writeln ('mang B:');
for i:= 1 to n do writeln (B[i]);

for i:=1 to 2*n do
 begin
   C[2*i]:=B[i];
   C[2*i-1]:=A[i];
 end;

i:=2;
while i<=2*n do
 begin
  if A[i]>1 then
   begin
    j:=2;
    while A[i] mod j<>0 do inc(j);
    if j=A[i] then inc(d);
   end;
   i:=i+2;
 end;

writeln ('mang C:');
for i:=1 to 2*n do writeln (C[i]);
writeln (d);

readln
end.
