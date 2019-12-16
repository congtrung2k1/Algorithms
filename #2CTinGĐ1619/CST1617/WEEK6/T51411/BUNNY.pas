Type matrix=Array[1..6,1..6] Of int64;
     matrix1 =array [1..6,1..1] of int64;
Const a:matrix=((0,0,0,1,0,0),
                (0,0,0,0,1,1),
                (1,1,1,0,0,0),
                (0,0,0,0,1,0),
                (1,0,0,0,0,0),
                (0,1,0,0,0,0));
	fi='bunny.inp';
	fo='bunny.out';
        du=1000000;

Var n:Int64;
	res:matrix;
        p: matrix1;
	i,j,k:Byte;
	b:matrix1=((1),(0),(2),(0),(0),(1));
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
 If n=1 then Exit(a);
 temp:=power(n div 2);
 temp:=nhan(temp,temp,6,6,6);
 If odd(n) then temp:=nhan(temp,a,6,6,6);
 Exit(temp);
End;
Procedure TRy;
 BEGIN
 Assign(f,fi);Reset(f); Assign(g,fo);Rewrite(g);
 Readln(f,n);
  If n=1 then Writeln(g,1)
   Else If n=2 then writeln(g,2)
    else if n=3 then writeln(g,3)
    Else
    begin
    Fillchar(p,sizeof(p),0);
    res:= power(n-3);
     For i:=1 to 6 do
      For j:=1 to 1 do
       For k:=1 to 6 do
        p[i,j]:=(p[i,j]+((res[i,k]*b[k,j]) mod du) mod du);
    Writeln(g,(p[1,1]+p[2,1]+p[3,1]) mod du);
    end;
 Close(f);Close(g);
 END;


Begin
 Try;
End.
