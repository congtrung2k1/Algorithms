USES MATH;
CONST FI='VNA.INP';
      FO='VNA.OUT';
TYPE LIST=^NODE;
     NODE= RECORD V,C: LONGINT; LINK: LIST; END;
VAR A: ARRAY [0..200005] OF LIST;
    COL,XD: ARRAY [0..200005] OF LONGINT;
    FREE: ARRAY [0..200005] OF BOOLEAN;
    N,M,ANS: LONGINT;
    F,G: TEXT;

Procedure DFS(Cha,X,C: Longint);
 Var Y,TS: Longint;
     Tmp: List;
 Begin
 Tmp:=A[x];
 Free[x]:=False;
 While Tmp<>Nil do
  Begin
  Y:=Tmp^.V; TS:=Tmp^.C;
  If Free[y] Then If C=0 then Begin XD[y]:=1; DFS(X,Y,1); End
   Else Begin XD[y]:=-1; DFS(X,Y,-1); End
    ELSE If NOT Free[y] Then
   If (XD[y]*XD[x]<0) And (Cha<>Y) then Begin Writeln(g,'IMPOSIBLE'); CLOSE(G); HALT; END;
  Tmp:=tmp^.Link;
  End;
 End;

Procedure Try;
 Var i,Ans,X,D: Longint;
 Begin
 Fillchar(Free,Sizeof(Free),True);
 Ans:=0;
 For i:=1 to n do XD[i]:=0;
 For i:=1 to n do If Col[i]<>2 then Free[i]:=False;
 For i:=1 to n do If Col[i]=1 then Inc(Ans);
 For i:=1 to n do
  If Free[i] Then Begin XD[i]:=1; DFS(0,i,1); End;
 X:=0; D:=0;
 For i:=1 to n do
  If Xd[i]=-1 then Inc(X) Else If Xd[i]=1 Then Inc(D);
 Ans:=Ans+Min(X,D);
 Writeln(G,Ans);
 Close(G);
 End;

//0: KHONG CO MAU, 1: CO MAU, 2: CHUA CO MAU
Procedure Init;
 Var Tmp: List;
     U,V,C,I: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,n,m);
 For n:=1 to n do Col[n]:=2;
 For n:=1 to n do A[n]:=nil;
 For I:=1 to m do
  Begin
  Readln(f,u,v,c);
  If C=2 then
   Begin
   If (Col[u]=2) Or (Col[u]=1) then Col[u]:=1 Else Begin Writeln(g,'IMPOSIBLE'); Close(G); Exit; end;
   If (Col[v]=2) Or (Col[v]=1) then Col[v]:=1 Else Begin Writeln(g,'IMPOSIBLE'); Close(G); Exit; end;
   End;
  If C=0 then
   Begin
   If (Col[u]=2) Or (Col[u]=0) then Col[u]:=0 Else Begin Writeln(g,'IMPOSIBLE'); Close(G); Exit; end;
   If (Col[v]=2) Or (Col[u]=0) then Col[v]:=0 Else Begin Writeln(g,'IMPOSIBLE'); Close(G); Exit; end;
   End;
  New(Tmp);
  Tmp^.v:=v; Tmp^.c:=c; Tmp^.link:=A[u]; A[u]:=Tmp;
  New(Tmp);
  tmp^.v:=u; Tmp^.c:=C; Tmp^.link:=A[v]; A[v]:=tmp;
  End;
 Close(F);
 Try;
 End;


Begin
 Init;
End.
