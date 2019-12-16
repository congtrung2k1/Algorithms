USES MATH;
CONST FI='BAOTIN.INP';
      FO='BAOTIN.OUT';

VAR A: ARRAY [0..1000005] OF REAL;
    N: LONGINT;
    K,MAXA,KQ: REAL;
    F: TEXT;

PROCEDURE INIT;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,K);
 Readln(f,N);
 For n:=1 to n do Begin readln(f,a[n]); MaxA:=Max(A[n],MaxA); End;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j: longint;
     X,Y: REAL;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do dec(j);
 if not(i>j) then begin
                y:=a[i]; a[i]:=a[j]; a[j]:=y;
                inc(i); Dec(j);
             end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Function Xet(TG: Real): Boolean;
 Var i: Longint;
     T1,T2,T3: REAL;
 Begin
 I:=1;
 A[0]:=0; T1:=0; T1:=T1+TG;
 Repeat
 T2:=A[i+1]; T3:=0;
 IF (T1+K>=T2) Then T3:=Max(T3,Max(T2,T1+K));
 IF (T1+K>=T2-TG) And (T2-TG>0) Then T3:=Max(T3,Max(T2-TG,T1+K));
 IF T1+K>=T2+TG Then T3:=Max(T3,MaX(T2+TG,T1+K));
 If T3=0 Then Exit(False);
 T1:=T3;
 Inc(i);
 Until i>n-1;
 Exit(True);
 End;

Procedure Try;
 VAR L,R,M: REAL;
     T:Longint;
 Begin
 Sort(1,n);
 L:=0; R:=MaxA; T:=0;
 Repeat
 M:=(L+r)/2;
 Inc(t);
 IF Xet(m) Then
  Begin
  IF (KQ>M) Or (KQ=0) THEN KQ:=M ELSE EXIT;
  R:=m end else L:=M;
 Until ((L=M) AND (R=M)) OR (T>100);
 End;

Procedure Outp;
 Begin
 Assign(f,FO); Rewrite(F);
 Writeln(F,KQ:0:3);
 Close(F);
 End;

Begin
 Init;
 Try;
 OUTP;
End.
