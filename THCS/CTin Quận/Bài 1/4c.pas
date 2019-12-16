program  tong3;
uses crt;
var x,n,i,tong,lt: longint;
begin
writeln ('nhap x');
readln (x); writeln;
writeln ('nhap n');
readln (n); writeln;
lt:=1;
for i:= 1 to (2*n-1) do
  begin
    lt:=lt*x;
    if i mod 2<>0 then tong:=tong+lt;
  end;
writeln  ('tong: ',tong);
readln
end.




