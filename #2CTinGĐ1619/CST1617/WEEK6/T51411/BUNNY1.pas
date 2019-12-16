CONST FI='BUNNY.INP';
      FO='BUNNY.OUT';
      BASE=1000000;
TYPE MATRIX=ARRAY [1..6,1..6] OF LONGINT;

VAR B: MATRIX=((1,1,1,0,0,0),(0,0,0,1,1,0),(0,0,0,0,0,1),
               (0,1,0,0,0,0),(0,0,1,0,0,0),(0,0,0,0,1,0));
    A: MATRIX;
    N: QWORD;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 Close(F);
 End;

Function Nhan(A,B: MATRIX;M,N,P:LONGINT):Matrix;
 Var i,j,k: longint;
     C: Matrix;
 Begin
 Fillchar(c,sizeof(c),0);
 For i:=1 to m do
  For j:=1 to n do
   For k:=1 to p do
    C[i,j]:=(C[i,j]+(A[i,k]*B[k,j] mod base)) mod base;
 Exit(C);
 End;

Function Power(x: longint):Matrix;
 Var C: Matrix;
 Begin
 c:=B;
 If x=1 then exit(B);
 C:=Nhan(C,C,6,6,6);
 If odd(x) then C:=Nhan(C,B,6,6,6);
 Power(x div 2);
 End;


PRocedure Try;
 Begin
 Assign(F,FO); Rewrite(F);
 IF n=1 then writeln(F,1)
  else
   if n=2 then writeln(f,2)
    else
    begin
    B:=POWER(N-3);
    A[1,1]:=1; A[1,2]:=1; A[1,3]:=0; A[1,4]:=0; A[1,5]:=1; A[1,6]:=2;
    A:=Nhan(B,A,6,6,6);
    Writeln(f,(A[1,1]+A[1,2]+A[1,3]) MOD BASE);
    End;
 Close(F);
 End;



Begin
 Init;
 Try;
End.
