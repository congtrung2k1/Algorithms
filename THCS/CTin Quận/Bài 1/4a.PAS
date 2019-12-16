program  tong1;
uses crt;
var x,n,i,tong: longint;
begin
writeln ('nhap n');
readln (n); writeln;

writeln ('nhap x');
readln (x); writeln;

for i:= 1 to n do tong:= tong+ (i*x);
writeln  ('tong: ',tong);
readln
end.
