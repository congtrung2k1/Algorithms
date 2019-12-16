USES MATH;
CONST FI='KGSS.INP';
      FO='KGSS.OUT';
TYPE LIST= RECORD
     X,Y: LONGINT;
     END;
VAR  T: ARRAY [0..8*10000] OF LIST;
     A: ARRAY [0..8*10000] OF LONGINT;
     F,G: TEXT;
     N,M: LONGINT;
     Ans,T1,T2: LIST;

Function Max1(Var X,y: List): List;
 Begin
 If X.x>y.x then Exit(X) Else Exit(Y);
 End;

Procedure Build(x,low,High: Longint);
 Var Mid: Longint;
 Begin
 If Low=High Then Begin T[x].x:=A[Low]; T[x].y:=low; Exit; End;
 Mid:=(Low+High) Div 2;
 Build(2*x,Low,Mid);
 Build(2*x+1,Mid+1,High);
 T[x]:=Max1(T[2*x],T[2*x+1]);
 End;

Procedure Update(X,Low,High,Left,Right,Val: Longint);
 Var Mid: Longint;
 Begin
 If (Right<Low) Or (Left>High) Then Exit;
 If (Left<=Low) And (High<=Right) Then
  Begin T[x].x:=Val; Exit; End;
 Mid:=(Low+High) Div 2;
 Update(2*x,Low,Mid,Left,Right,Val);
 Update(2*x+1,Mid+1,High,Left,Right,Val);
 T[x]:=Max1(T[x*2],T[x*2+1]);
 End;

Function Get(X,Low,High,Left,Right: Longint): List;
 Var Tmp,T1,T2: List;
     Mid: Longint;
 Begin
 Tmp.x:=0; Tmp.y:=0;
 If (Right<Low) Or (Left>High) Then Exit(Tmp);
 If (Left<=Low) And (High<=Right) Then Exit(T[x]);
 Mid:=(Low+High) Div 2;
 T1:=Get(2*x,Low,Mid,Left,Right);
 T2:=Get(2*x+1,Mid+1,High,Left,Right);
 Exit(Max1(T1,T2));
 End;

Procedure Init;
 Var u,v,l: Longint;
     C: Char;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,n);
 For n:=1 to n do Read(f,a[n]);
 Build(1,1,n);
 Readln(F);
 Readln(f,m);
 For m:=1 to m do
  Begin
  Readln(F,c,u,v);
  If C='U' Then Update(1,1,n,u,u,v);
  If C='Q' Then Begin
   Ans:=Get(1,1,n,u,v);
   L:=Ans.Y;
   T1:=Get(1,1,n,u,L-1);
   T2:=Get(1,1,N,L+1,v);
   Writeln(G,Ans.x+Max(T1.x,T2.x));
   End;
  End;
 Close(F); Close(G);
 end;


Begin
 Init;
End.