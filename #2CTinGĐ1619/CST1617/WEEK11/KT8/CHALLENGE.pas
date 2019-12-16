//CAO NGUYET MINH - TEAM 1
USES MATH;
CONST FI='CHALLENGE.INP';
      FO='CHALLENGE.OUT';

VAR A,B: ANSISTRING;
    FX: ARRAY [0..100005,0..1005] OF LONGINT;
    N,M,ANS: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,b);
 Readln(f,a);
 Close(F);
 End;


Procedure Try;
 Var i,j: Longint;
 Begin
// Fillchar(Fx,sizeof(fx),0);
 Assign(f,fo); Rewrite(F);
 N:=Length(A); M:=Length(B);
 If (N>100000) then Begin Writeln(f,N-M-1); Close(F); End;
 Ans:=0;
 For i:=1 to n do
  For j:=1 to m do Begin
   Fx[i,j]:=Max(Fx[i,j-1],Fx[i-1,j]);
   If A[i]=B[j] then Fx[i,j]:=Max(Fx[i,j],Fx[i-1,j-1]+1);
   Ans:=Max(Ans,Fx[i,j]);
   End;
 Writeln(f,Ans);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
