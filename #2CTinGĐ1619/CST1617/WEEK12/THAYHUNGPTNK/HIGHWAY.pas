USES MATH;
CONST FI='HIGHWAY.INP';
      FO='HIGHWAY.OUT';
      Inf=Trunc(10e16)+5;
VAR A,B,C,Q: ARRAY [0..45] OF INT64;
    QUEUET,QUEUEP: ARRAY [0..50000] OF INT64;
    QUEUE,QUEUEX: ARRAY [0..50000] OF LONGINT;
    T,S,Ans: INT64;
    N,FRONT,REAR: LONGINT;
    F: TEXT;

Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); reset(F);
 Readln(f,n,t,s);
 Readln(f,A[1],B[1],C[1]);
 For i:=2 to n do Readln(f,Q[i],A[i],B[i],C[i]);
 Close(F);
 End;

Procedure Push(U,X,Thoigian,chiphi: Longint);
 Begin
 Inc(Rear);
 Queue[Rear]:=U;
 QueueX[Rear]:=X;
 QueueT[Rear]:=Thoigian;
 QueueP[Rear]:=Chiphi;
 End;

Procedure BFS;
 Var U,V,X: LONGINT;
     THOIGIAN,D: INT64;
 Begin
 Ans:=Inf;
 If A[1]<=T Then Push(1,1,A[1],0);
 If B[1]<=T Then Push(1,2,B[1],C[1]); Front:=1;
 Repeat
  U:=Queue[Front]; X:=QueueX[Front];
  Thoigian:=QueueT[Front]; D:=QueueP[Front]; Inc(Front);
  If U=N Then Begin Ans:=Min(Ans,D); Continue; End;
  V:=U+1;
  If X=1 Then Begin
   If Thoigian+A[V]<=T Then Push(V,1,Thoigian+A[v],D);
   If Thoigian+B[V]+Q[v]<=T Then Push(V,2,Thoigian+B[v]+Q[v],D+C[V]);
   End;
  If X=2 Then Begin
   If Thoigian+A[V]+Q[v]<=T Then Push(V,1,Thoigian+A[v]+Q[v],D);
   If Thoigian+B[v]<=T Then Push(V,2,Thoigian+B[v],D+C[V]);
   End;
 Until Front>Rear;
 End;

Procedure BFS1;
 Var U,V,X: LONGINT;
     THOIGIAN,D: INT64;
 Begin
 Ans:=inf; Rear:=0;
 Push(n,1,A[n],0);
 If (C[n]<=S) Then Push(n,2,B[n],C[n]); Front:=1;
 Repeat
  U:=Queue[Front]; X:=QueueX[Front];
  Thoigian:=QueueT[Front]; D:=QueueP[Front]; Inc(Front);
  If U=1 Then Begin Ans:=Min(Ans,Thoigian); Continue; End;
  V:=U-1;
  If X=1 Then Begin
   Push(V,1,Thoigian+A[v],D);
   If (D+C[v]<=S) Then Push(V,2,Thoigian+B[v]+Q[u],D+C[V]);
   End;
  If X=2 Then Begin
   Push(V,1,Thoigian+A[v]+Q[u],D);
   If (D+C[v]<=S) Then Push(V,2,Thoigian+B[v],D+C[V]);
   End;
 Until Front>Rear;
 End;

Procedure Try;
 Begin
 BFS;
 Assign(f,fo); Rewrite(F);
 If Ans=inf then Write(f,-1,' ') else Write(f,Ans,' ');
 BFS1;
 If Ans=inf then Writeln(f,-1) else Write(f,Ans);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
