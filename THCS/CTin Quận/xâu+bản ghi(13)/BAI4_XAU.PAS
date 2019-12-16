program bai4_trang13;
uses crt;
var a,b: string; i: longint;
begin
clrscr;
writeln ('nhap cau'); readln (a);
b:='';

while (pos(' ',a))<>0 do delete(a,pos(' ',a),1);
for i:=1 to length(a) do
 if (a[i]>='0') and (a[i]<='9') then b:=b+a[i];

writeln ('xau a:'); writeln (a);
writeln ('xau b:'); writeln (b);
readln
end.