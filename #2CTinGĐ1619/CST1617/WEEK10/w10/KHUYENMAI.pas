USES MATH;
CONST FI='KHUYENMAI.INP';
      FO='KHUYENMAI.OUT';

VAR A: ARRAY [0..1005,0..1005] OF Boolean;
    RA,VAO: ARRAY [0..1005] OF LONGINT;
    FREE: ARRAY [0..1005] OF BOOLEAN;
    KQ,ANS,K,N,I,U: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Fillchar(A,sizeof(A),False);
 Readln(f,n,k);
 For i:=1 to n do
  Begin
  Read(f,u);
  If u<>i then A[i,u]:=true;
  Inc(Ra[i]); Inc(Vao[u]);
  End;
 Close(F);
 End;


Procedure Chay(x,Sum: Longint);
 VAR Y: LONGINT;
 Begin
 Free[x]:=False;
 For y:=1 to n do
  If A[x,y] then
   If Free[y] then
    Begin
    Free[y]:=False;
    Chay(y,sum+1);
   // Free[y]:=True;
    End;
 Kq:=Max(kq,sum);
 End;

Procedure Try;
 Begin
 Fillchar(Free,Sizeof(Free),True);
 For i:=1 to n do
  If (Free[i]) and (Vao[i]=0) then Begin
   kq:=0; Chay(i,1);
   If Ans+KQ>K Then continue;
   ans:=Ans+KQ;
   If Ans>=k Then Break;
   End;
 For i:=1 to n do
  If (Free[i]) And (Vao[i]=Ra[i]) then
   Begin
   Kq:=0; Chay(i,1);
   Ans1+KQ+Ans>K Then continue;
   Ans1:=Ans1+Kq;
   If Ans1>=k Then Break;
   end;
 Writeln(ans);
 End;


Begin
 Init;
 Try;
End.