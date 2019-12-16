USES MATH;
CONST FI='BONGBONG.INP';
      FO='BONGBONG.OUT';

VAR STACK: ARRAY [0..200005] OF LONGINT;
    R,X: ARRAY [0..200005] OF Extended;
    N,TOP,T,I: LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For n:=1 to n do Readln(f,x[n],r[n]);
 Close(F);
 End;

Procedure Try;
 Var tmp: Extended;
 Begin
 Stack[1]:=1; Top:=1;
 For i:=2 to n do
  Begin
  T:=Top;
  While T>0 Do
   Begin
   tmp:=Sqr(X[Stack[t]]-X[i])/(4*R[Stack[t]]);
   R[i]:=Min(R[i],tmp);
   If R[i]>=R[Stack[t]] then Dec(T) else Break;
   End;
  Top:=T;
  Inc(top); Stack[top]:=i;
  End;
 Assign(f,fo); Rewrite(F);
 For i:=1 to n do Writeln(f,R[i]:0:3);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
