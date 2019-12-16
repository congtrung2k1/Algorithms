USES MATH;
CONST FI='PANO.INP';
      FO='PANO.OUT';

VAR N,M,TMP,X,XI,XJ,KQ: LONGINT;
    L,S,C,ID: ARRAY [0..105] OF LONGINT;
    A,B: ARRAY [0..20005] OF LONGINT;
    Trace,VT: ARRAY [0..105,0..20005] OF LONGINT;
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
 fillchar(a,sizeof(a),0);
    for i:=1 to m do
     begin
      b:=a;
      for j:=1 to n do Trace[i,j]:=0;
      for j:=s[i] to min(n,s[i]+l[i]-1) do
       for k:=max(1,j-l[i]+1) to s[i] do
        if b[j]<a[k-1]+(j-k+1)*c[i] then
         begin
          b[j]:=a[k-1]+(j-k+1)*c[i];
          Trace[i,j]:=k;
         end;
      for j:=s[i]+l[i] to n do if b[j]<b[j-1] then
       begin
        b[j]:=b[j-1];Trace[i,j]:=Trace[i,j-1];
       end;
      a:=b;
     end;
 Assign(f,fO); Rewrite(F);
 Writeln(F,A[N]);
 Close(F);
 {Kq:=0;
 FillChar(Trace,sizeof(Trace),0);
 For i:=1 to m do
  Begin
  B:=A;
  For j:=1 to n do Trace[i,j]:=0;
  For j:=S[i] to min(n,s[i]+L[i]-1) do
   For K:=Max(1,j-l[i]+1) to s[i] do
    If Fx[j,i]<Fx[k-1,i-1]+(j-k+1)*c[i] then
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
  End;     }
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
  While (j>=1) And (A[j]=A[j-1]) Do Dec(j);
  Ans[Id[i]]:=Trace[i,j];
  Ans1[id[i]]:=j;
  J:=Trace[i,j]-1;
  End;
 Assign(F,FO); Rewrite(F);
 Writeln(F,A[n]);
 For i:=1 to m do
  IF (ans[i]=0) then Writeln(f,0)
   Else Writeln(f,Ans[i],' ',Ans1[i]);
 Close(F);
 End;


Begin
 Init;
 Try;
// TruyVet;
End.
