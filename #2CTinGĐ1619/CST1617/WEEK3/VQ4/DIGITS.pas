CONST FI='DIGITS.INP';
      FO='DIGITS.OUT';

VAR N,CHUSO,i: longint;
    KQ,low,high: INT64;
    MU: ARRAY [0..11] OF int64;
    F: text;


PRocedure Init;
 Begin
 Assign(F,FI); Reset(F);
 readln(f,n);
 Close(F);
 End;


Procedure Try;
 Begin
 Mu[0]:=1;
 For i:=1 to 10 do Mu[i]:=Mu[i-1]*10;
 chuso:=1;
 kq:=0;
 Repeat
 low:=Mu[chuso-1];
 high:=Mu[chuso]-1;
 if N<high then high:=N;
 kq:=kq+INT64((high-low+1)*chuso);
 if Mu[chuso]>N then break;
 chuso:=chuso+1;
 Until false;
 Assign(f,FO); Rewrite(F); Writeln(f,kq); Close(F);
 End;


Begin
 Init;
 Try;
End.
