Uses math;
CONST FI='CAPSO.INP';
      FO='CAPSO.OUT';

VAR FX1,FX2: ARRAY [-1..300050,-1..25] OF INT64;
    A,ANS: ARRAY [-1..300050] OF LONGINT;
    N,T: LONGINT;
    F: TEXT;


Function Log2(X: Longint): Longint;
 Begin
 Exit(Trunc(Ln(X)/ln(2)));
 End;

Function GCD(A,b: Longint): Longint;
 Begin
 If a=0 then exit(b);
 If b=0 then exit(a);
 Exit(gcd(b,a mod b));
 End;
Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=0 to n-1 do Read(f,a[i]);
 Close(F);
 End;


Function Check(X: Longint): Boolean;
 Var K,i,j,mi,gc: longint;
 Begin
 K:=Log2(X+1);
  For i:=0 to n-x-1 do
  Begin
  j:=i+x;
  Mi:=Min(Fx1[j-(1 shl k)+1,k],Fx1[i,k]);
  GC:=GCD(Fx2[j-(1 shl k)+1,k],Fx2[i,k]);
  If GC=Mi Then exit(true)
  End;
  exit(false);
 end;

Procedure Outp(X: Longint);
 Var K,i,j,gc,mi: Longint;
 Begin
 K:=Log2(X+1); T:=0;
 If K>0 then
  For i:=0 to n-x-1 do
   Begin
   j:=i+x;
   Mi:=Min(fx1[j-(1 shl k)+1,k],Fx1[i,k]);
   GC:=GCD(Fx2[j-(1 shl k)+1,k],Fx2[i,k]);
   If GC=Mi then Begin Inc(T); Ans[T]:=i; End;
   End
  Else
  For i:=0 to n-1 do Begin Inc(T); Ans[t]:=i; end;
 Assign(f,fo); Rewrite(F);
 Writeln(f,T,' ',x);
 For T:=1 to T do Write(F,Ans[t]+1,' ');
 Close(F);
 End;


Procedure Try;
 Var i,j,l,r,m: longint;
 Begin
 For i:=0 to n-1 do Begin Fx1[i,0]:=A[i]; Fx2[i,0]:=A[i]; End;
 For i:=0 to 20 do
  For j:=0 to n-1 do
   Begin
   fx1[j,i]:=fx1[j-1,i];
   fx2[j,i]:=fx2[j-1,i];
   If (j+(1 shl (i-1)))<n then
    Begin
    Fx1[j,i]:=Min(Fx1[j+(1 shl (i-1)),i-1],Fx1[j,i-1]);
    Fx2[j,i]:=GCD(Fx2[j+(1 shl (i-1)),i-1],Fx2[j,i-1]);
    end;
   End;
 L:=0; R:=n-1;
 While L>R do
  Begin
  M:=(L+R) Div 2;
  If Check(M) then l:=m else r:=m-1;
  End;
 Outp(L);
 end;


Begin
 Init;
 Try;
End.
