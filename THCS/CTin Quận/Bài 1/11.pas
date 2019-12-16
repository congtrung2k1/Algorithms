program bai11;
uses crt;
var a,n,s: extended;
begin
writeln ('nhap so thuc a'); readln(a); writeln;
n:=0;
s:=0;
while a>=s do
  begin
    n:=n+1; s:=s+1/n; 
  end;
writeln ('n la: ',n:1:1);
readln
end.
