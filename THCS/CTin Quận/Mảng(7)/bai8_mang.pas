program bai8_trang7;
uses crt;
var A,B:  array [1..99] of longint;
    i,n: longint;
begin
clrscr;
randomize;
writeln ('nhap so phan tu'); readln (n); writeln;
for i:= 1 to n do
  begin
   A[i]:=random(200);
   writeln (A[i]);
  end;
writeln;

writeln ('Cac phan tu cua mang la:');
for i:= 1 to n do write (A[i],' '); writeln;

B[1]:=A[1];
for i:= 2 to n do B[i]:=B[i-1]+A[i];

writeln ('mang B la: ');
for i:=1 to n do writeln (B[i]);

readln
end.
