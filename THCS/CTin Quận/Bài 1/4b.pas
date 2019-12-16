program  tong2;
uses crt;
var x,n,i,j,tong,lt: longint;
begin
clrscr;
writeln ('nhap x');
readln (x); writeln;
writeln ('nhap n'); lt:=1;
readln (n); writeln;
for i:= 1 to n do
  begin
   lt:= lt*x;
   tong:= tong+lt;
  end;
writeln  ('tong: ',tong);
readln
end.
