program  bai18;
uses crt;
var s:extended;  n:longint;
begin
s:=0;
for n:=1to 50 do
s:=s+n/(n+1);
writeln (s:1:2);
readln
end.