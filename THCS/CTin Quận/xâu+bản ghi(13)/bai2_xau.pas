program bai2_trang13;
uses crt;
var a,b: string; i: longint;
begin
clrscr;
writeln ('nhap xau a'); readln(a);
b:='';
for i:= length(a) downto 1 do b:=b+a[i];
if a=b then writeln ('la xau doi xung')
       else writeln ('k la xau doi xung');
readln
end.
