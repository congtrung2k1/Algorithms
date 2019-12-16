program tong4;
uses crt;
var x,n,lt,i,tong: longint;
begin
clrscr;
writeln ('nhap x'); readln (x);  writeln;
writeln ('nhap n'); readln (n);  writeln;
lt:=1;  tong:=0;
for i:=1 to n do
  begin
    lt:=lt*x;
    if i mod 2 <>0 then tong:= tong+lt
                   else tong:= tong-lt;
  end;
writeln ('tong la ', tong);
readln
end.