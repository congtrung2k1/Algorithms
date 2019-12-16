program bai3;
uses crt;
var n,i,tong,j:integer;
begin
clrscr;
writeln ('nhap n');
readln (n); writeln;
tong:=0;
for j:=2 to n-1 do
  begin
   i:=2;
   while j mod i <>0 do inc(i);
   if i=j then
     begin
       writeln (j);
       tong:= tong+j;
     end;
  end;
writeln ('tong la ', tong);
readln
end.