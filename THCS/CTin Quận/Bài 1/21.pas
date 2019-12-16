program bai21;
uses crt;
var k,n,s:longint;
begin
writeln ('nhap n'); readln(n); writeln;
k:=1;
s:=3;
while s<n do
  begin
   inc(k);
   s:=3*s;
  end;
writeln ('k=',k,',s=',s);
readln
end.