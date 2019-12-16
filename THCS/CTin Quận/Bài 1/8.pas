program bai8;
uses crt;
var p,q,r: longint;
    function gapdoi(p,q,r:longint) :longint;
      var a1,b1,c1: longint;
      begin
       a1:=2*p;
       b1:=2*q;
       c1:=2*r;
       writeln ('la cap so nhan.');
       writeln ('gap doi cac so:');
       writeln (a1,',',b1,',',c1);
      end;

    function giam(p,q,r:longint):longint;
      var a1,b1,c1:longint;
      begin
       a1:=p-1;
       b1:=q-1;
       c1:=r-1;
       writeln ('khong la cac cap so nhan.');
       writeln ('giam 1 moi so:');
       writeln (a1,',',b1,',',c1);
      end;
begin
clrscr;
writeln ('nhap p,q,r'); readln (p,q,r); writeln;
if p*r=q*q then writeln (gapdoi(p,q,r)) else writeln (giam(p,q,r));
readln
end.