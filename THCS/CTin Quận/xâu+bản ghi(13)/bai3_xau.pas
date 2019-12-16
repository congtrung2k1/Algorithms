program bai3_trang13;
uses crt;
var a: string; i: longint;
begin
clrscr;
writeln ('nhap xau a'); readln (a);
for i:= 1 to (length(a) div 2+1) do
  if a[i] <> a[length(a)-i+1] then break;
if i= (length(a) div 2+1) then writeln ('la xau doi xung')
                          else writeln ('k la xau doi xung');
readln
end.