CONST FI='SAMAC.INP';
      FO='SAMAC.OUT';
      Inf=Trunc(10e7);
VAR A: ARRAY [0..6505,0..6505] OF REAL;
    X,Y: ARRAY [0..6505] OF REAL;
    FREE: ARRAY [0..6505] OF BOOLEAN;
    D: ARRAY [0..6505] OF REAL;
    N,D1,D2: LONGINT;
    F: TEXT;


Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 Readln(f,d1);
 Readln(f,d2);
 Close(F);
 end;

Function Cal(u,v: Longint):Real;
 Begin
 Exit(Sqrt(Sqr(X[u]-X[v])+Sqr(Y[u]-Y[v])));
 End;

Procedure Khoitao;
 Var i,j: Longint;
 Begin
 For i:=1 to n do
  For j:=1 to n do
  A[i,j]:=Cal(i,j);
 For i:=1 to n do
  Begin
  A[0,i]:=abs(y[i]-d1); A[i,0]:=A[0,i];
  A[i,n+1]:=abs(y[i]-d2); A[n+1,i]:=A[i,n+1];
  End;
 A[0,n+1]:=Inf;
 A[n+1,0]:=Inf;
 Inc(n);
 End;

Function Djistra(TS: Real): Real;
 Var u,v,i: Longint;
     Mini: Real;
 Begin
 Fillchar(Free,Sizeof(Free),True);
 For i:=1 to n do d[i]:=Inf; D[0]:=0; u:=0;
 Repeat
 For i:=1 to n do
  If (D[u]+A[u,i]<D[i]) And (Free[i]) And (A[u,i]<=TS) Then D[i]:=D[u]+A[u,i];
 Mini:=inf; V:=0;
 For i:=1 to n do
  If (D[i]<Mini) And (Free[i]) Then Begin Mini:=D[i]; V:=i; End;
 If V=0 Then Break;
 If V=N Then Break;
 U:=V;
 Free[u]:=False;
 Until False;
 Exit(D[n]);
 End;

Procedure Try;
 Var L,R,M,Tmp,Kq1,Kq2: Real;
     T: Longint;
 Begin
 L:=0; R:=Trunc(10e15); T:=0;
 Repeat
 M:=(L+R)/2;
 Tmp:=Djistra(M);
 If Tmp<inf Then Begin Kq1:=M; Kq2:=Tmp; R:=M; End
  Else L:=M;
 Inc(T);
 Until ((L=M) And (R=M)) Or (T>=100);
 Assign(f,fo); ReWrite(F);
 Writeln(f,Kq1:0:3);
 Writeln(f,Kq2:0:3);
 Close(F);
 End;

Begin
 Init;
 Khoitao;
 Try;
End.
