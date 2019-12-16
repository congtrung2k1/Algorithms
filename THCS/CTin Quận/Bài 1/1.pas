program bai1;
uses crt;
var n,i: longint;
begin
writeln ('nhap n'); readln (n); writeln;
if n<=1 then writeln ('khong la so nguyen to') else
  begin
    i:=2;
    while n mod i<>0 do inc(i);
    if i=n then writeln ('la so nguyen to')
           else writeln ('khong la so nguyen to');
  end;
readln
end.