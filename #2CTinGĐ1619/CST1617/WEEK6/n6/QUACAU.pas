USES MATH;
CONST FI='QUACAU.INP';
      FO='QUACAU.OUT';

VAR A,NH,AT: ARRAY [0..1000000] OF LONGINT;
    X,Y: ARRAY [0..1000000] OF BYTE;
    L,B,N,ANS,T: LONGINT;
    KT: BOOLEAN;
    S: Ansistring;
    F,G: TEXT;

Procedure Try;
 Var I,J,TMP,D,C: Longint;
 Begin
 For l:=1 to l do A[l]:=l;
 D:=1; C:=B;
 Tmp:=N+B+1;
 For i:=N Downto 1 Do
  If S[i]='0' Then Tmp:=i Else NH[I]:=tmp;
 Tmp:=0;
 For i:=1 to n do
  If S[i]='1' Then Tmp:=i Else AT[I]:=Tmp;
 Repeat
 If S[C]='0' Then A[l]:=AT[C] Else A[l]:=C;
 For I:=l-1 Downto 1 Do
  If S[A[I+1]-1]='1' Then A[I]:=A[I+1]-1 Else A[I]:=AT[I+1];
 Tmp:=A[1]-D;
 Tmp:=Min(Tmp,NH[C]);
 D:=D+TMP;
 C:=C+TMP;
 IF (D=N-L+1) And (C=N) Then Kt:=True;
 Inc(i);
 Until KT;
 Writeln(g,Ans);
 End;

PROCEDURE INIT;
 Begin
 Assign(f,FI); Reset(F);
 Assign(G,FO); Rewrite(G);
 Readln(f,T);
 For T:=1 to T do
  Begin
  Readln(f,L,B,N);
  Readln(f,S);
  Try;
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.
