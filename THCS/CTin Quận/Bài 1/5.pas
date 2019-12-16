program bai5;
uses crt;
var a,b,c: longint;
begin
clrscr;
writeln ('nhap a,b,c'); readln (a,b,c); writeln;
if a>=0 then writeln ('binh phuong ',a,' la: ',a*a)
        else writeln ('lap phuong cua ',a,' la: ',a*a*a);
if b>=0 then writeln ('binh phuong ',b,' la: ',b*b)
        else writeln ('lap phuong cua ',b,' la: ',b*b*b);
if c>=0 then writeln ('binh phuong ',c,' la: ',c*c)
        else writeln ('lap phuong cua ',c,' la: ',c*c*c);
readln
end.