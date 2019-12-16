CONST FI='STARS.INP';
      FO='STARS.OUT';

VAR
    A: ARRAY [0..76,0..76,0..76] OF CHAR;
    KQ: ARRAY ['a'..'z'] of Longint;
    I,J,K,X,T,N,TMP: lONGINT;
    S: ANSISTRING;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); reset(F);
 Readln(f,n);
 For i:=1 to n do
  Begin
  Readln(f,s); S:=S+'|'; X:=1;
  Repeat
  Tmp:=Pos('|',S); T:=0;
   For k:=1 to tmp do
    If s[k]<>' ' then
     Begin
     Inc(T); A[i,t,x]:=S[k];
     If T=N Then Begin T:=0; Inc(X); End;
     End;
   Delete(S,1,Tmp+1);
  Until Length(S)<=0;
  End;
 Close(F);
 End;

Function Check(Tang,Vitrix,Vitriy: Longint): Boolean;
 Var x,y,k: Longint;
 Begin
 X:=Vitrix; Y:=Vitriy; K:=Tang;
 If (A[X,Y,K]=A[X-1,Y,K]) And (A[X,Y,K]=A[X+1,Y,K]) THEN
  IF (A[X,Y,K]=A[X,Y+1,K]) AND (A[X,Y,K]=A[X,Y-1,K]) THEN
   IF (A[X,Y,K-1]=A[X,Y,K]) AND (A[X,Y,K+1]=A[X,Y,K]) THEN
    Exit(True);
 Exit(False);
 End;

Procedure Try;
 Var i,j,k,Ans: Longint;
     C: CHAR;
 Begin
 Ans:=0;
 For k:=2 to n-1 do
  For i:=1 to n do
   For j:=1 to n do
    If Check(k,i,j) Then
     Begin
     Inc(Ans);
     Inc(KQ[A[i,j,k]]);
     End;
 Assign(f,fo); Rewrite(F);
 Writeln(f,ans);
 For c:='a'to 'z' do If Kq[c]<>0 then Writeln(f,c,' -> ',Kq[c]);
 Close(F);
End;

Begin
 Init;
 Try;
End.
