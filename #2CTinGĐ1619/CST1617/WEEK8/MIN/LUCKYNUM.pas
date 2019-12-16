CONST FI='LUCKYNUM.INP';
      FO='LUCKYNUM.OUT';

VAR Fx: ARRAY [0..1005,0..1005] OF LONGINT;
    I,J,N,K: LONGINT;
    F:TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,k);
 Close(F);
 End;


Procedure Try;
 Begin
 Fx[0,0]:=0;
 Fx[1,0]:=9;
 For i:=2 to n do Fx[i,0]:=Fx[i-1,0]*10;
 For i:=1 to n do
  For j:=1 to k do
  If i<j then Fx[i,j]:=0 else
   if j=i then fx[i,i]:=1 else
    Fx[i,j]:=9*Fx[i-1,j]+Fx[i-1,j-1]-9*Fx[i-2,j-1];
 Writeln(Fx[n,k]);
 End;


Begin
 Init;
 Try;
End.
