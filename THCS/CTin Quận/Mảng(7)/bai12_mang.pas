program bai12_trang11;
uses crt;
var A:  array [1..100] of longint;
    n,i,min,max,cmi,cma,d,g: longint;
begin
clrscr;
    repeat
writeln ('nhap so phan tu'); readln (n); writeln;
for i:= 1 to n do
  begin
    write ('A[',i,']='); readln (A[i]);
  end;
    until (2<=n) and (n<=100);

writeln ('Cac phan tu cua mang la:');
for i:= 1 to n do write (A[i],' '); writeln;

max:=A[1]; min:=A[1]; cmi:=1; cma:=1;
for i:= 1 to n do
 begin
  if A[i]>max then
   begin
     max:=A[i]; cma:=i;
   end;
  if A[i]<=min then
   begin
     min:=A[i]; cmi:=i;
   end;
 end;

g:=A[cma]; A[cma]:=A[cmi]; A[cmi]:=g;
if cmi<cma then d:=(cma-cmi+1) else d:=(cmi-cma+1);

writeln ('mang A da doi:');
for i:= 1 to n do write (A[i],' '); writeln;
writeln ('so phan tu thuoc [min;max]=',d);

readln
end.