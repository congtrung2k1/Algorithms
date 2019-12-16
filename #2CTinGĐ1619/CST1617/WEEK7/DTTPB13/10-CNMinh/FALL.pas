CONST FI='FALL.IN';
      FO='FALL.OUT';
      INF=TRUNC(10E8);
VAR N,A,B,M,ANS,VTI,VTJ: LONGINT;
    X,Y,H,ID,A1,A2,A3: ARRAY [0..10005] OF LONGINT;
    D: ARRAY [-20001..20001] OF LONGINT;
    Fx,TRACEU,TRACEV: ARRAY [0..10005,0..3] OF LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Readln(F,n,a,b,m);
 For n:=1 to n do BEGIN
  readln(F,X[N],Y[N],H[N]);
  ID[N]:=N;
  END;
 Close(F);
 End;

Procedure Swap(Var x,y: Longint);
 Var Tmp: longint;
 Begin
 Tmp:=X; X:=Y; Y:=Tmp;
 End;

Procedure Djistra(A,B: Longint);
 VAR I,J,TMP: LONGINT;
 Begin
 Inc(N);
 X[n]:=A; Y[N]:=A; H[N]:=B; D[A]:=B;
 For i:=1 to n-1 do
  For j:=i+1 to n do
   If H[j]>H[i] then
    Begin
    Swap(X[i],X[j]);
    Swap(Y[i],Y[j]);
    Swap(H[i],H[j]);
    Swap(ID[i],Id[j]);
    End;
 Fx[1,1]:=0; Fx[1,2]:=0;
 For i:=2 to n do
  Begin
  Fx[i,1]:=Inf; Fx[i,2]:=Inf;
  For j:=1 to i-1 do
   If (H[J]-H[I]<=M) And (X[j]>=X[i]) And (X[j]<=Y[i]) And (D[X[j]]=H[j]) then
    Begin
    Tmp:=Fx[j,1]+H[j]-H[i]+X[J]-X[i];
    IF Tmp<Fx[i,1] then
     begin
     Fx[i,1]:=Tmp;
     TraceU[i,1]:=j;
     TraceV[i,1]:=1;
     End;
    Tmp:=Fx[j,2]+H[j]-H[i]+Y[i]-X[j];
    IF Tmp<Fx[i,2] then
     Begin
     Fx[i,2]:=Tmp;
     TraceU[i,2]:=j;
     TraceV[i,2]:=1;
     End;
    End;
  For j:=1 to i-1 do
   If (H[J]-H[I]<=M) And (Y[j]>=X[i]) And (Y[j]<=Y[i]) And (D[Y[j]]=H[j]) then
    Begin
    Tmp:=Fx[j,1]+H[j]-H[i]+Y[J]-X[i];
    IF Tmp<Fx[i,1] then
     begin
     Fx[i,1]:=Tmp;
     TraceU[i,1]:=j;
     TraceV[i,1]:=2;
     End;
    Tmp:=Fx[j,2]+H[j]-H[i]+Y[i]-Y[j];
    IF Tmp<Fx[i,2] then
     Begin
     Fx[i,2]:=Tmp;
     TraceU[i,2]:=j;
     TraceV[i,2]:=2;
     End;
    End;
  For j:=X[i] to Y[i] DO D[j]:=H[i];
  End;
 Ans:=Inf;
 For i:=1 to n do Begin
  IF H[i]>M then continue;
  If D[X[i]]=H[i] Then
   If Fx[i,1]+H[i]<ANS then
    Begin
    ANS:=Fx[i,1]+H[i];
    Vti:=i;
    Vtj:=1;
    End;
  IF D[Y[i]]=H[i] then
   If Fx[i,2]+H[i]<ANS then
    BEgin
    ANS:=Fx[i,2]+H[i];
    Vti:=i;
    Vtj:=2;
    End;
  End;
 End;

Procedure TruyVet;
 Var i,j,u,v,nans,tmp: longint;
 Begin
 i:=vti; j:=vtj;
 nans:=0;
 Repeat
 U:=TraceU[I,J];
 V:=TraceV[I,J];
 Inc(NAns);
 A1[Nans]:=ID[i];
 A3[NAns]:=V;
 If j=1 then
  if v=1 then Tmp:=X[u]-X[i] else Tmp:=Y[u]-X[i];
 IF j=2 then
  If v=1 then Tmp:=Y[i]-X[u] else Tmp:=Y[i]-Y[u];
 A2[Nans]:=Fx[i,j]-Tmp;
 I:=U;
 J:=V;
 Until i<=1;
 Assign(f,fO); Rewrite(F);
 Writeln(F,ans);
 For i:=NAns downto 1 do Writeln(f,A1[i],' ',A2[i],' ',A3[i]);
 Close(F);
 End;

Procedure Try;
 VAR I: LONGINT;
 Begin
 For i:=-20000 to 20000 do D[i]:=Inf;
 Djistra(A,B);
 TruyVet;
 End;

Begin
 Init;
 Try;
End.
