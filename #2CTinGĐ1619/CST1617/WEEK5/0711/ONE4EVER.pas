Type matrix=Array[1..2,1..2] Of int64;
Const
	fi='ONE4EVER.inp';
	fo='ONE4EVER.out';

Var n,a,b,base,k:Int64;
    i,j:Byte;
    F1,F2: Matrix;
    f,g:Text;


Function Cal(x,y: int64): int64;
 Begin
 If y=0 then exit(0);
 If y=1 then exit(x);
 If odd(y) then
  exit((cal(x,y div 2)*2+x) mod base)
   else exit((cal(x,y div 2)*2) mod base);
 End;

Function Nhan(a,b: matrix;m,p,n:longint):matrix;
 Var i,j,k: byte;
     c: matrix;
 Begin
 Fillchar(c,sizeof(c),0);
 For i:=1 to m do
  For j:=1 to p do
   For k:=1 to n do
    c[i,j]:=(c[i,j]+(cal(a[i,k],b[k,j])) mod base) mod base;
 nhan:=c;
 End;


Function power(n:Int64):matrix;
Var temp:matrix;
Begin
 If n=1 then Exit(f1);
 temp:=power(n div 2);
 temp:=nhan(temp,temp,2,2,2);
 If odd(n) then temp:=nhan(temp,f1,2,2,2);
 Exit(temp);
End;

BEGIN
 Assign(f,fi);Reset(f); Assign(g,fo);Rewrite(g);
 Readln(f,a,b,base,k);
 If k=1 then writeln(g,b mod base)
  else
  if k=2 then writeln(g,Cal(a+1,b))
   else
   begin
   f1[1,1]:=a; f1[1,2]:=0;
   f1[2,1]:=b mod base; f1[2,2]:=1;
   F1:=power(k-2);
   F2[1,1]:=b mod base; f2[1,2]:=1;
   F2[2,1]:=Cal(a+1,b); F2[2,2]:=1;
   F2:=Nhan(f2,f1,2,2,2);
   Writeln(g,f2[2,1]);
   End;
 Close(f);Close(g);
END.
