CONST FI='LUCKYNUM.INP';
      FO='LUCKYNUM.OUT';
      Base=1000000007;
VAR N,K: LONGINT;
    F:TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,k);
 Close(F);
 End;

Function Mu10(X: Longint): int64;
 Var Ans: int64;
 Begin
 If x=0 Then Exit(1);
 Ans:=1;
 For X:=1 to X do
  Ans:=(Ans*10) Mod Base;
 Exit(Ans Mod Base);
 End;

Procedure Try;
 Begin
 Writeln(((Mu10(n-k-2) Mod Base)*(180+81*(n-k-1)) Mod Base) Mod Base);
 End;


Begin
 Init;
 Try;
End.
