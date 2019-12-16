program bai22;
uses crt;
var n,p,q,g,h,i: longint;
begin
clrscr;
writeln ('nhap a0, a1'); readln (p,q); writeln;
writeln ('nhap n'); readln (n); writeln;
g:=p; h:=q;
if n=0 then writeln ('An= ',p);
if n=1 then writeln ('An= ',q);
if n>1 then
  for i:=2 to n do
    if i mod 2=0 then g:=g+p else h:=h+q;
if n mod 2 =0 then writeln ('An= ',g) else writeln ('An= ',h);
readln
end.
