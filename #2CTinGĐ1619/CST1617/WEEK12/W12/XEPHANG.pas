Uses Math;
CONST FI='XEPHANG.INP';
      FO='XEPHANG.OUT';
Type List=^node;
     Node=Record V: Longint; Link: List;End;
     TList=Record x,y,l: Longint; End;

VAR T,N,M,K,V,TPLT: LONGINT;
    A,B: ARRAY [0..1005,0..1005] OF BOOLEAN;
    DS: ARRAY [0..100005] OF TLIST;
    DSD: ARRAY [0..1005] OF LIST;
    P,D,D1,KQ: ARRAY [0..1005] OF LONGINT;
    F: TEXT;

Procedure Install(U,V: Longint);
 Var Tmp: list;
 Begin
 New(Tmp); Tmp^.v:=v; Tmp^.Link:=DSD[u]; DSD[u]:=Tmp;
 End;

//SO HANG, SO DOI, SO CAP
Procedure ChuyenDoi(S: String);
 Var i,U,V,j: Longint;
 Begin
 U:=0; V:=0;
 I:=Max(Pos('>',S),Max(Pos('<',S),Pos('=',S)));
 For j:=1 to i-1 do U:=U*10+Ord(S[j])-48;
 For j:=i+1 to Length(S) do V:=V*10+Ord(S[j])-48;
 Case S[i] of
  '=': Begin Install(u,v); Install(v,u); End;
  '>': Begin Inc(T); DS[T].x:=u; DS[T].y:=v; DS[T].l:=1; End;
  '<': Begin Inc(T); DS[T].x:=u; DS[T].y:=v; DS[T].l:=2; End;
  End;
 End;

Procedure Init;
 Var S: String;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m,v); TPLT:=0; T:=0;
 Fillchar(P,Sizeof(P),0);
 For m:=1 to m do DSD[m]:=Nil;
 For v:=1 to v do
  Begin
  Readln(f,S);
  ChuyenDoi(S);
  End;
 Close(F);
 End;

Procedure DFS2(X: Longint);
 Var Y: Longint;
     Tmp: List;
 Begin
 Tmp:=DSD[x];
 While Tmp<>nil do
   Begin
   y:=Tmp^.v;
   If P[y]=0 Then
   Begin P[y]:=P[x]; DFS2(Y); End;
   Tmp:=Tmp^.Link;
   end;
 End;

Procedure DungDoThi;
 Var Tmp: List;
     I,U,V,C: Longint;
 Begin
 For i:=1 to m do P[i]:=0;
 For i:=1 to m do
  If P[i]=0 Then
  Begin
  U:=i; Inc(TPLT); P[i]:=TPLT;
  DFS2(U);
  End;
 For i:=1 to T do
  Begin
  U:=DS[i].X; V:=DS[i].Y; C:=DS[i].L;
  If C=1 then Begin A[P[u],P[v]]:=True; B[P[v],P[u]]:=True; End
    Else Begin A[P[u],P[v]]:=True; B[P[v],P[u]]:=True; End;
  End;
 End;

Procedure DFS(X: Longint);
 Var Y: Longint;
 Begin
 For Y:=1 To TPLT Do
  If A[x,y] Then Begin D[Y]:=Max(D[y],D[x]+1); DFS(Y); End;
 End;

Procedure DFS1(X: Longint);
 Var Y: Longint;
 Begin
 For Y:=1 To TPLT Do
  If B[x,y] Then Begin D1[Y]:=Max(D1[y],D1[x]+1); DFS1(Y); End;
 End;

Procedure Try;
 Var i: Longint;
 Begin
 Fillchar(A,sizeof(A),False); Fillchar(B,sizeof(B),False);
 DungDoThi;
 For i:=1 to TPLT do
  If D[i]=0 Then Begin D[i]:=1; DFS(i); End;
 Fillchar(D1,sizeof(D1),0);
 For i:=1 To TPLT do
  If D1[i]=0 Then Begin D1[i]:=1; DFS1(i); End;
 For i:=1 to TPLT do
  If D[i]+D1[i]>N then KQ[i]:=D[i] Else KQ[i]:=-1;
 Assign(f,fo); Rewrite(F);
 For i:=1 to M do
  If KQ[P[i]]<>-1 Then Writeln(f,'K',KQ[P[i]]) Else Writeln(f,'?');
 Close(F);
 End;

Begin
 Init;
 Try;
End.
