program bai1_trang13;
uses crt;
var a: string; i:longint;
begin
clrscr;
writeln ('nhap xau'); readln (a);
writeln(a); writeln;
for i:=length(a) downto 1 do write(a[i]);
readln
end.
