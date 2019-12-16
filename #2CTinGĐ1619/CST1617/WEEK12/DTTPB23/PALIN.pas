CONST FI='PALIN.INP';
      FO='PALIN.OUT';
     // INF=TRUNC(10e9);
TYPE LIST= ARRAY [0..250] OF CHAR;
VAR N,P,K,Timer,M,INF: LONGINT;
    Fx,Fx1: array [0..250,0..2] Of Longint;
    Gx,Gx1: array [0..250,0..2,0..2] of Longint;
    Loai: Array [0..10] of Longint;
    S: LIST;
    F,G: TEXT;

Function Convert(Var S: LIST; X: Longint): Boolean;
 Var U,i: Longint;
 Begin
 U:=0;
 While X<>0 do Begin
  If U=M Then Exit(False);
  Inc(U);
  S[m-u+1]:=Chr((X mod 26)+97);
  X:=X div 26;
//  Writeln(s); Readln;
  End;
 For i:=1 to m-u do S[i]:='a';
 Exit(True);
 End;

Function DP1(i,Ok: Longint): Longint;
 Var Limit,x: Longint;
 Begin
 If i=m+1 then Exit(1);
 If Fx1[i,Ok]=Timer Then Exit(Fx1[i,ok]);
 Fx[i,ok]:=0; Limit:=25;
 If Ok=0 Then Limit:=Ord(s[i])-97;
 For x:=0 to Limit do
  If x<Ord(S[x])-97 Then Fx[i,ok]:=Fx[i,ok]+DP1(i+1,Ok);
 Fx1[i,ok]:=Timer;
 Exit(Fx[i,ok]);
 End;

Function DP2(i,ok1,ok2: Longint): Longint;
 Var limit,j: Longint;
 Begin
 If i=(m+1) div 2+1 Then
  Begin
  If Ok1=0 then exit(1);
  If Ok2<>2 Then Exit(1);
  Exit(0);
  End;
 If Gx1[i,ok1,ok2]=Timer Then Exit(Gx[i,ok1,ok2]);
 Gx[i,ok1,ok2]:=0;
 Limit:=25; If Ok1=0 Then Limit:=Ord(S[i])-97;
 For j:=0 to Limit do
  If j=Ord(S[m-i+1])-97 Then Begin
   If j<Ord(S[i])-97 Then Gx[i,ok1,ok2]:=Gx[i,ok1,ok2]+Dp2(i+1,ok1,ok2);
   End
   Else
   If j<Ord(S[m-i+1])-97 Then Begin
    If j<Ord(S[i])-97 Then Gx[i,ok1,ok2]:=Gx[i,ok1,ok2]+Dp2(i+1,ok1,1);
    End
     Else
      If j<Ord(S[i])-97 Then Gx[i,ok1,ok2]:=Gx[i,ok1,ok2]+Dp2(i+1,ok1,2);
 Gx1[i,ok1,ok2]:=Timer;
 Exit(Gx[i,ok1,ok2]);
 End;

Function Check(X: Longint):Longint;
 Var Tmp: Longint;
 Begin
 Tmp:=Inf;
 If not Convert(S,X) Then Exit(Inf);
 Inc(Timer);
 Exit(DP1(1,0)-DP2(1,0,0));
 End;

Procedure Try;
 Var L,R,I,Mid,Len: Longint;
 Begin
 M:=N;
 Fillchar(Loai,Sizeof(Loai),0);
 For i:=1 to p do
  Begin If M mod 2=0 Then Loai[i]:=1; M:=(M+1) Div 2; End;
 L:=0; R:=Inf;
 While L<R do
  Begin
  Mid:=(L+R) Div 2;
  If Check(Mid)<K Then L:=Mid+1 Else R:=Mid;
  End;
 Writeln(L);
 Convert(S,L); Len:=m;
 For P:=1 to P do
  If Loai[P]=0 Then Begin
   For i:=Len+1 to Len*2-(Len Div 2) do S[i]:=S[Len*2-i];
   Len:=Len*2-i;
   End
  Else
   Begin
   For i:=Len+1 to Len*2 do S[i]:=S[2*len-i+1];
   Len:=Len*2;
   End;
 For i:=1 to n do Writeln(S[i]);
 Writeln(g,S);
 End;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(g);
 Inf:=10000;
 While not eof(F) do
  Begin
  Readln(f,n,p,k);
  Try;
  End;
 Close(F); Close(G);
 End;

Begin
 Init;
End.
