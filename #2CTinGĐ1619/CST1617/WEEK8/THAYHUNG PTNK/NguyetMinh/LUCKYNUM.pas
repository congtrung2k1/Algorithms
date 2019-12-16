CONST FI='LUCKYNUM.INP';
      FO='LUCKYNUM.OUT';
      BASE=1000000007;

VAR ANS,N,K: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(F,fI); Reset(f);
 REadln(F,n,k);
 Close(F);
 End;


Procedure Subtask1;
 Var i: Longint;
 Begin
 If n=1 then Begin Writeln(f,1); Exit; End;
 Ans:=9;
 Dec(n,2);
 For i:=1 to n do Ans:=Ans*10 Mod Base;
 Writeln(f,Ans);
 End;

Begin
 Init;
 Assign(f,fo); Rewrite(F);
 If k=1 then Subtask1;
 Close(F);
End.


