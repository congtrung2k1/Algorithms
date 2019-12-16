CONST FI='GAME.INP';
      FO='GAME.OUT';

VAR A: ARRAY [0..1001,0..1001] OF BOOLEAN;
    P,Visit: ARRAY [0..1001] OF BOOLEAN;
    N,ROOT,KQ: LONGINT;
    F: TEXT;


Procedure Init;
 Var i,u,v: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,root);
 Fillchar(A,sizeof(A),False);
 For i:=1 to n-1 do
  Begin
  Readln(f,u,v);
  A[u,v]:=True;
  A[v,u]:=True;
  End;
 Close(F);
 End;


Procedure DFS(X: Longint);
 Var y: Longint;
 Begin
 Visit[x]:=True;
 For y:=1 to n do
  If A[x,y]=True then
   If not Visit[y] then
    Begin
    DFS(Y);
    If not P[y] Then P[x]:=True;
    End;
 End;

Procedure Try;
 Var i: Longint;
 Begin
 Fillchar(Visit,sizeof(Visit),False);
 Fillchar(P,Sizeof(P),False);
 DFS(root);
 If Not P[Root] Then KQ:=-1
  Else
  For i:=1 to N do
   If A[i,Root] And (not P[i]) Then
    Begin
    Kq:=i;
    Exit;
    End;
 End;


Procedure Outp;
 Begin
 Assign(f,fo); Rewrite(F);
 Writeln(f,KQ);
 Close(F);
 End;



Begin
 Init;
 Try;
 Outp;
End.