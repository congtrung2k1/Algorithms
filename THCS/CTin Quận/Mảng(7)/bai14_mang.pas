program bai14_trang11;
uses crt;
var A,B,C: array [1..50] of extended;
    n,m,i,o: longint;
begin
clrscr;

    repeat
writeln ('co bao nhieu phan tu?');
write ('mang A? '); readln (n);
write ('mang B? '); readln (m);
    until (1<m) and (m<n)  and (n<51);
for i:= 1 to n do
 begin
   write ('A[',i,']='); readln (A[i]);
 end;
for i:= 1 to m do
 begin
   write ('B[',i,']='); readln (B[i]);
 end;

writeln ('mang A:');
for i:= 1 to n do write (A[i]:1:1,' '); writeln;
writeln ('mang B:');
for i:= 1 to m do write (B[i]:1:1,' '); writeln;

o:=0;
for i:=1 to n do
   if A[i]<B[1] then
     begin
       inc(o);
       C[o]:=A[i];
     end;
for i:=1 to n do
   if (B[1]<=A[i]) and (A[i]<=B[m]) then
     begin
       inc(o);
       C[o]:=A[i];
     end;
for i:= 1 to n do
   if A[i]>B[m] then
     begin
       inc(o);
       C[o]:=A[i];
     end;

writeln ('mang C:');
for i:=1 to o do write (C[i]:1:1,' ');

readln
end.
