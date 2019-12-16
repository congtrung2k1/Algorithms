USES MATH;
CONST FI='COVUA.INP';
      FO='COVUA.OUT';

VAR FX,C: ARRAY [0..1000,0..1000] OF LONGINT;
    XET: ARRAY [0..35] OF BOOLEAN;
    A: ARRAY [0..35,0..35] OF CHAR;
    KQ,D,H: ARRAY [0..35] OF LONGINT;
    TRACE: ARRAY [0..1000] OF LONGINT;
    KT: BOOLEAN;
    ANS1,ANS,KQ1,N,M,S,T,Start: LONGINT;
    F: TEXT;


Procedure Init;
 Var i,j: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to n do Begin
  For j:=1 to n do
   Read(f,a[i,j]);
   Readln(F);
   End;
 Close(F);
 end;

Procedure Khoitao;
 Var i,j: Longint;
 Begin
 Fillchar(D,sizeof(D),0);
 h:=D;
 For i:=1 to n do
  For j:=1 to n do
   Case A[i,j] of
    '1': Begin D[i]:=D[i]+2; h[i]:=h[i]+2; End;
    'd': Begin D[i]:=D[i]+1; h[i]:=h[i]+1; End;
    '.': h[i]:=h[i]+2;
    end;
 End;

Procedure XayMang(K: Longint);
 VAR Q,E,I,J: LONGINT;
 Begin
 Fillchar(Xet,sizeof(xet),False);
 Kt:=True; Q:=N; E:=0;
  For i:=1 to n do
   For j:=1 to i-1 do
    If (A[i,j]='.') And ((i<>k) or (j<>k)) then
     Begin
     Inc(Q);
     C[Q,i]:=2; C[Q,j]:=2;
     Xet[i]:=true; Xet[j]:=true;
     End;
  T:=Q;
  For i:=1 to n do
   If Xet[i] then
    Begin
    C[i,T]:=H[k]-D[i];
    If C[i,T]<0 then Begin Kt:=False; Exit; End;
    Inc(E,C[i,T]);
    End;
  If (Q-1-N)*2>E Then Begin Kt:=false; Exit; end;
  Start:=(Q-1-N)*2;
  Inc(Q); S:=Q;
  For Q:=N+1 To T-1 do C[S,Q]:=2;
  M:=S;
 end;

Function FindPath: Boolean;
 Var U,V,Front,Rear: Longint;
     Queue: Array [0..500] Of Longint;
 Begin
 Fillchar(Trace,Sizeof(Trace),0);
 Front:=1; Rear:=1; Queue[1]:=S; Trace[S]:=M+1;
 Repeat
 U:=Queue[Front]; Inc(Front);
 For V:=1 to M do
  If (Trace[v]=0) And (C[u,v]>Fx[u,v]) Then
   Begin
   Trace[v]:=u;
   If V=T Then Exit(True);
   Inc(Rear); Queue[Rear]:=V;
   End;
 Until Front>Rear;
 FindPath:=False;
 End;


Procedure IncFlow;
 Var delta,U,v: Longint;
 Begin
 delta:=Maxlongint;
 V:=T;
 Repeat
 U:=Trace[V];
 Delta:=Min(Delta,C[u,v]-Fx[u,v]);
 V:=U;
 Until V=S;
 V:=T;
 Repeat
 U:=Trace[V];
 Inc(Fx[u,v],Delta); Dec(Fx[v,u],Delta);
 V:=U;
 Until V=S;
 End;

Function KiemTra(K: Longint):Boolean;
 Var u,v,Q,E: Longint;
 Begin
 For u:=1 to m do
  For v:=1 to m do
   If Fx[u,v]>=0 Then
    If V=T Then
     Begin
     E:=E+Fx[u,v];
     If h[k]<D[u]+Fx[U,V] Then Exit(False);
     End;
 If E<Start then exit(False);
 Exit(True);
 End;

Procedure Try;
 Var X,i,j,TMp: Longint;
 Begin
 Khoitao; Ans:=0; fillchar(KQ,Sizeof(KQ),0);
 For X:=1 to n do
  Begin
  XayMang(X); Ans1:=h[X];
  Fillchar(Fx,Sizeof(Fx),0);
  If KT Then
   Begin
   Repeat
    If not FindPath Then Break;
    IncFlow;
   Until False;
   If (Kiemtra(X)) Then Begin inc(KQ1); KQ[Kq1]:=X; End
   End;
  End;
 Assign(f,fo); Rewrite(F);
 For i:=1 to kq1 do Write(F,Kq[i],' ');
 Close(F);
 End;



Begin
 Init;
 Try;
End.
