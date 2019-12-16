program  tong_uoc;
uses crt;
var n,tong,i: integer;
begin
clrscr;
writeln ('nhap  n');
readln (n); writeln;
tong:=0;
for i:=1 to n do
  if n mod i =0  then
   begin
     writeln (i);
     tong:= tong+i;
   end;
writeln ('tong la: ',tong);
readln
end.