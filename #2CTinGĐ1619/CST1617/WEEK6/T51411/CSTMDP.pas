Type matrix=Array[1..3,1..3] Of int64;
Const a:matrix=((0,1,0),(0,0,1),(1,2,3));
	fi='CSTMDP.inp';
	fo='CSTMDP.out';
        du=27081998;

Var n:Int64;
	res,p,c:matrix;
	i,j,k:Byte;
	b:matrix=((1,0,0),(3,0,0),(11,0,0));
	f,g:Text;


Function Nhan(a,b: matrix;m,p,n:longint):matrix;
 Var i,j,k: byte;
     c: matrix;
 Begin
 Fillchar(c,sizeof(c),0);
 For i:=1 to m do
  For j:=1 to p do
   For k:=1 to n do
    c[i,j]:=(c[i,j]+(a[i,k]*b[k,j]) mod du) mod du;
 nhan:=c;
 End;


Function power(n:Int64):matrix;
Var temp:matrix;
Begin
 If n=1 then Exit(c);
 temp:=power(n div 2);
 temp:=nhan(temp,temp,3,3,3);
 If odd(n) then temp:=nhan(temp,a,3,3,3);
 Exit(temp);
End;

Procedure TRy;
 BEGIN
 Assign(f,fi);Reset(f); Assign(g,fo); Rewrite(g);
  Readln(f,n);
  If n=1 then Writeln(g,3)
   Else If n=2 then writeln(g,11)
    Else
    begin
    c:=a;
    Fillchar(p,sizeof(p),0);
    res:= power(n-2);
     For i:=1 to 3 do
      For j:=1 to 1 do
       For k:=1 to 3 do
        p[i,j]:=(p[i,j]+((res[i,k]*b[k,j]) mod du) mod du);
    Writeln(g,(p[3,1]) mod du);
    end;
 Close(f);Close(g);
 END;


Begin
 Try;
End.
