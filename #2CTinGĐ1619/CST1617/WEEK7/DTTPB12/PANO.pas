USES MATH;
CONST FI='PANO.INP';
      FO='PANO.OUT';

VAR N,M,TMP,X,XI,XJ,KQ: LONGINT;
    L,S,C,ID: ARRAY [0..105] OF LONGINT;
    FX,Trace,VT: ARRAY [0..20005,0..105] OF LONGINT;
    F: TEXT;

Procedure Init;
 Var i: Longint;
 Begin
 Assign(F,FI); Reset(F);
 Readln(f,n,m);
 For i:=1 to m do Begin
  ID[i]:=i;
  Readln(F,L[i],C[i],S[i]);
  End;
 Close(F);
 End;

Procedure Swap(Var X,y: Longint);
 Var Tmp: Longint;
 Begin
 Tmp:=x; X:=Y; Y:=Tmp;
 End;

Procedure Try;
 Var i,j,k: Longint;
 Begin
 For i:=1 to M-1 do
  For j:=i+1 to M do
   If S[j]<S[I] Then
    Begin
    Swap(S[i],S[j]); Swap(L[i],L[j]); Swap(C[i],C[j]); Swap(ID[i],Id[j]);
    End;
 Kq:=0;
 FillChar(Trace,sizeof(Trace),0);
 For i:=1 to m do
  Begin
  For j:=1 to n do Trace[i,j]:=0;
  For j:=S[i] to min(n,s[i]+L[i]-1) do
   For K:=Max(1,j-l[i]+1) to s[i] do
    If Fx[j,i]<Fx[k-1,i]+(j-k+1)*c[i] then
     Begin
     Fx[j,i]:=Fx[k-1,i-1]+(j-k+1)*C[i];
     Trace[i,j]:=k;
     End;
   For j:=S[i]+L[i] To n do
    If Fx[j,i]<Fx[j-1,i] then
     Begin
     Fx[j,i]:=Fx[j-1,i];
     Trace[i,j]:=Trace[i,j-1];
     End;
  End;
  Assign(f,FO); Rewrite(F);
  Writeln(f,Fx[n,m]);
  Close(F);

 End;

Procedure TruyVet;
 Var Ans,Ans1: ARRAY [0..105] OF LONGINT;
     I,J,TMP: LONGINT;
 Begin
 Fillchar(ans,sizeof(ans),0);
 Ans1:=Ans;
 I:=m; J:=n;
 While i>=1 do
  Begin
  while (i>=1) And (Trace[i,j]=0) do dec(i);
  If i=0 then break;
  While (j>=1) And (Fx[j,i]=Fx[j-1,i]) Do Dec(j);
  Ans[Id[i]]:=Trace[i,j];
  Ans1[id[i]]:=j;
  J:=Trace[i,j]-1;
  End;
 Writeln(0);
 Assign(F,FO); Rewrite(F);
 Writeln(F,Fx[n,m]);
 For i:=1 to m do
  IF (ans[i]=0) then Writeln(f,0)
   Else Writeln(f,Ans[i],' ',Ans1[i]);
 Close(F);
 End;


Begin
 Init;
 Try;
 //TruyVet;
End.
