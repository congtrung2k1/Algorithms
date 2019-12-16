USES MATH;
CONST FI='DATPHONG.INP';
      FO='DATPHONG.OUT';
      INF=Maxlongint;
TYPE LIST= RECORD
     X,Y: LONGINT;
     END;
VAR  T: ARRAY [0..8*500000] OF LIST;
     A,B,C,D,E: ARRAY [0..500005] OF LONGINT;
     F,G: TEXT;
     N,M,O: LONGINT;
     Ans,T1,T2: LIST;

Function Min1(Var X,y: List): List;
 Begin
 If X.x<y.x then Exit(X) Else Exit(Y);
 End;

Procedure Build(x,low,High: Longint);
 Var Mid: Longint;
 Begin
 If Low=High Then Begin T[x].x:=A[Low]; T[x].y:=low; Exit; End;
 Mid:=(Low+High) Div 2;
 Build(2*x,Low,Mid);
 Build(2*x+1,Mid+1,High);
 T[x]:=Min1(T[2*x],T[2*x+1]);
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
 T[x]:=Min1(T[x*2],T[x*2+1]);
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
 If T1.x=0 Then Exit(T2) Else If T2.x=0 Then Exit(t1);
 Exit(Min1(T1,T2));
 End;

Procedure Init;
 Var u,v,l: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m,o);
 For n:=1 to n do Readln(f,A[n],B[n]);
 For m:=1 to m do Readln(f,C[m],D[m]);
 Close(F);
 end;

Procedure Swap(Var x,y: Longint);
 Var Tmp: Longint;
 Begin
 Tmp:=x; X:=Y; Y:=tmp;
 End;

Procedure QSortA (l,r : LongInt);
 Var i1,j1,x,y,lock : LongInt;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r;
 lock:=l+Random(r-l+1);
 x:=B[lock];
 Repeat
 While (B[i1]<x) do inc(i1);
 While (B[j1]>x) do dec(j1);
 if i1<=j1 then
  Begin
  Swap(B[i1],B[j1]);
  Swap(A[i1],A[j1]);
  inc(i1);
  dec(j1);
  End;
 Until i1>j1;
 QSortA(l,j1); QSortA(i1,r);
 End;

Procedure QSortB (l,r : LongInt);
 Var i1,j1,x,y,lock : LongInt;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r;
 lock:=l+Random(r-l+1);
 x:=C[lock]; y:=D[lock];
 Repeat
 While (C[i1]>x) or ((C[i1]=x) and (D[i1]<y)) do inc(i1);
 While (C[j1]<x) or ((C[j1]=x) and (D[j1]>y)) do dec(j1);
 if i1<=j1 then
  Begin
  Swap(C[i1],C[j1]);
  Swap(D[i1],D[j1]);
  inc(i1); dec(j1);
  End;
 Until i1>j1;
 QSortB(l,j1); QSortB(i1,r);
End;

Function TKNP (gt : LongInt) : LongInt;
    Var l,r,nho,x : LongInt;
    Begin
        l:=1; r:=N; nho:=0;
        Repeat
            x:=(l+r) div 2;
            if B[x]>=gt then
                Begin
                    nho:=x;
                    r:=x-1;
                End else l:=x+1;
        Until l>r;
        exit(nho);
    End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=e[(l+r) div 2];
 repeat
 while e[i]>x do inc(i);
 while x>e[j] do dec(j);
           if not(i>j) then
             begin
                y:=e[i];
                e[i]:=e[j];
                e[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

Procedure Try;
 Var U: Longint; Tx: List; Res: Int64;
 Begin
 QSortA(1,n); QSortB(1,m);
 Build(1,1,n);
 For M:=1 to M do
  Begin
  U:=TKNP(D[m]);
  If u=0 then continue;
  Tx:=Get(1,1,n,u,n);
  If C[m]<Tx.x Then Continue;
  E[M]:=C[m]-Tx.x;
  Update(1,1,n,tx.y,tx.y,Inf);
  End;
 Sort(1,m); Res:=0;
 For o:=1 to o do Res:=Res+E[o];
 Assign(f,fo); Rewrite(F);
 Writeln(f,Res);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
