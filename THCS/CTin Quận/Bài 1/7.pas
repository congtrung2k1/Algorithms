program bai7;
uses crt;
var a,b,c: longint;
    function gapdoi(a,b,c:longint) :longint;
      var a1,b1,c1: longint;
      begin
       a1:=2*a;
       b1:=2*b;
       c1:=2*c;
       writeln ('la cap so cong.');
       writeln ('gap doi cac so:');
       writeln (a1,',',b1,',',c1);
      end;

    function giam(a,b,c:longint):longint;
      var a1,b1,c1:longint;
      begin
       a1:=a-1;
       b1:=b-1;
       c1:=c-1;
       writeln ('khong la cac cap so cong.');
       writeln ('giam 1 moi so:');
       writeln (a1,',',b1,',',c1);
      end;
begin
clrscr;
writeln ('nhap a,b,c'); readln (a,b,c); writeln;
if a+c=2*b then writeln (gapdoi(a,b,c)) else writeln (giam(a,b,c));
readln
end.