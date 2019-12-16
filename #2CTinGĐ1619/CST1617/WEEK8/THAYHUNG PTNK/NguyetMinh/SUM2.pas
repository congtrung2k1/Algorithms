USES MATH;
CONST FI='SUM2.INP';
      FO='SUM2.OUT';


VAR I,J,N,ANS,L,R: LONGINT;
    A,SUM: ARRAY [0..100005] OF LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,l,r);
 For n:=1 to n do Read(f,A[n]);
 Close(F);
 End;


Procedure Try;
 Begin
 Sum[1]:=A[1];
 For i:=1 to l do Sum[i]:=Sum[i-1]+A[i];
 Ans:=Sum[i];
 i:=1; j:=l;
 Repeat
 Sum[j]:=Sum[j-1]+A[j];
 Ans:=Max(Ans,Sum[J]);
 If (J-I+1>=R) Then Begin Sum[j]:=Sum[j]-A[i]; Inc(I); End;
 Ans:=MaX(Ans,Sum[j]);
 If (A[i]<0) And (j-i+1>l) Then Begin
  Sum[j]:=Sum[j]-A[i]; Inc(i); end;
 {while (A[i]<0) And (j-i+1>L) And (j-i+1<=R) Do
                 Begin
                 Inc(i); Sum[j]:=Sum[j]-A[i]; Ans:=Max(Ans,Sum[j]);
                  End;    }
// While (j-i+1<L) do Begin Inc(j); Sum[j]:=Sum[j-1]+A[j]; End;
 Ans:=Max(Ans,Sum[j]);
 Inc(j);
 If (j>N) And (i>N-j+1) Then Break;
 Until False;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
