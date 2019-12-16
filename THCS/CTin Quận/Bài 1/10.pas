program bai10;
uses crt;
var stg: string; n,i,d:integer;
begin
writeln ('nhap n'); readln(n); writeln;
str(n,stg);
d:=0;
for i:=1 to length(stg) do if stg[i]='0' then d:=d+1;
writeln (d);
readln
end.