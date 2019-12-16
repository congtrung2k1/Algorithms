program bai19;
uses crt;
var s:extended; n,i,gt: longint;
begin
writeln ('nhap n'); readln (n); writeln;
gt:=1;
for i:=1 to n do
   begin
     gt:=gt*i;
     s:=s+ i/gt;
   end;
writeln ('tong la: ',s:1:2);
readln
end.