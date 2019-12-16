Type matrix=Array[1..2,1..2] Of int64;
Const a:matrix=((1,1),(1,0));
	fi='LATGACH4.inp';
	fo='LATGACH4.out';
        du=123456789;

Var n:Int64;
	res:matrix;
        p: matrix;
	i,j,k:Byte;
        c: matrix;
	b:matrix=((3,2),(2,1));
	f,g:Text;


Function Nhan(a,b: matrix;m,p,n:longint):matrix;
 Var i,j,k: byte;
     c: matrix;
 Begin
 Fillchar(c,sizeof(c),0);
 For i:=1 to m do
  For j:=1 to p do
   For k:=1 to n do
    c[i,j]:=(c[i,j]+(a[i,k]*b[k,j])mod du) mod du;
 nhan:=c;
 End;


Function power(n:Int64):matrix;
Var temp:matrix;
Begin
 If n=1 then Exit(c);
 temp:=power(n div 2);
 temp:=nhan(temp,temp,2,2,2);
 If odd(n) then temp:=nhan(temp,a,2,2,2);
 Exit(temp);
End;

Procedure TRy;
 Var test: longint;
 BEGIN
 Assign(f,fi);Reset(f); Assign(g,fo); Rewrite(g);
 Readln(f,test);
 For test:=1 to test do
  begin
  Readln(f,n);
  If n=1 then Writeln(g,1)
   Else If n=2 then writeln(g,2)
    else if n=3 then writeln(g,3)
    Else
    begin
    c:=a;
    Fillchar(p,sizeof(p),0);
    res:= power(n-3);
     For i:=1 to 2 do
      For j:=1 to 2 do
       For k:=1 to 2 do
        p[i,j]:=(p[i,j]+((res[i,k]*b[k,j]) mod du) mod du);
    Writeln(g,(p[1,1]) mod du);
    end;
  End;
 Close(f);Close(g);
 END;


Begin
 Try;
End.
