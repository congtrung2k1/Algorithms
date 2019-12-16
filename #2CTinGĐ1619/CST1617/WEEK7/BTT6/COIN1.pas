USES MATH;
CONST FI='COIN.INP';
      FO='COIN.OUT';
Type List=^node;
     node=record
     V: Longint; link:list;
     End;
VAR N,M,K,X,Y,L,T,Z,Loai: LONGINT;
    S,S1: STRING;
    Ke,Ke1: Array [0..30005] of List;
    A,D,D1,Nhom: Array [0..30000] of Longint;
    CX: Array [0..30000] OF Boolean;
    F:TEXT;
    C: CHAR;

Procedure TachS;
 Var i,T: Longint;
 Begin
 T:=Length(S);
 I:=1;
 Repeat
 S1:=S1+S[i]; Inc(i);
 Until (Ord(S[I])>=60) And (Ord(S[i])<=62);
 VAL(s1,x,l);
 C:=S[i]; S1:='';
 For i:=i+1 to T do S1:=S1+S[i];
 VAL(s1,y,l);
 S:='';
 S1:='';
 End;

Procedure Init;
 Var Tmp:list;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,Loai,k,m);
 n:=k;
 For m:=1 to m do
  Begin
  Readln(F,S);
  TACHS;
  Case C of
  '=' : Begin
        If (A[x]<>0) Then A[Y]:=A[x] else
         If (A[x]<>0) Then A[x]:=A[Y] else
          Begin Inc(T); A[x]:=T; A[y]:=T; end
        End;
  '>' : Begin
        If A[x]=0 Then Begin Inc(T); A[X]:=T; End;
        If A[y]=0 Then Begin Inc(T); A[Y]:=T; End;
        New(tmp);
        Tmp^.v:=A[y]; Tmp^.link:=Ke[A[x]]; Ke[A[x]]:=Tmp;
        New(Tmp);
        Tmp^.v:=A[x]; Tmp^.link:=Ke1[A[y]]; Ke1[A[Y]]:=Tmp;
        End;
  '<' : Begin
        If A[x]=0 Then Begin Inc(T); A[X]:=T; End;
        If A[y]=0 Then Begin Inc(T); A[Y]:=T; End;
        New(tmp);
        Tmp^.v:=A[y]; Tmp^.link:=Ke1[A[x]]; Ke1[A[x]]:=Tmp;
        New(Tmp);
        Tmp^.v:=A[x]; Tmp^.link:=Ke[a[y]]; Ke[a[Y]]:=Tmp;
        End;
  End;
  End;
 Close(F);
 End;

Procedure DFS(X: Longint);
 Var Tmp:List;
 Begin
 Tmp:=Ke[x]; Cx[x]:=True;
 While Tmp<>nil do
  Begin
  Y:=Tmp^.v;
  D[Y]:=Max(D[Y],D[X]+1);
  DFS(Y);
  Tmp:=Tmp^.link;
  End;
 End;

Procedure DFS1(X: Longint);
 Var Tmp: List;
 Begin
 Tmp:=Ke1[X]; Cx[X]:=True;
 While Tmp<>Nil do
  Begin
  Y:=Tmp^.V;
  D1[y]:=Max(D1[y],D1[x]+1);
  DFS1(Y);
  Tmp:=Tmp^.link;
  End;
 End;

Procedure Try;
 VAR I: LONGINT;
 Begin
 For i:=1 to k do
  If A[i]=0 then Begin Inc(T); A[i]:=T; End;
 N:=T;
 For i:=1 to N do
  If D[i]=0 then
  Begin D[i]:=1; Dfs(i); end;
 Fillchar(Cx,Sizeof(Cx),False);
 For i:=1 to N do
  IF D1[i]=0 Then
  Begin D1[i]:=1; Dfs1(i); end;
 For i:=0 to k do Nhom[i]:=0;
 For i:=1 to n do
  If D[i]+D1[i]>Loai Then Nhom[i]:=D1[i];
 Assign(f,fO); Rewrite(F);
 For i:=1 to k do
  If Nhom[A[i]]=0 then writeln(f,'?') else Writeln(f,'C',NHOM[A[I]]);
 Close(F);
 END;

Begin
 Init;
 Try;
End.


