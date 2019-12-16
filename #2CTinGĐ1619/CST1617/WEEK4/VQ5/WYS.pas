USES MATH;
CONST FI='WYS.INP';
      FO='WYS.OUT';

VAR FX: ARRAY [0..100000] OF LONGINT;
    N,M,TMP,ANS,I,J,X: LONGINT;
    F: TEXT;


PRocedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Readln(F,n);
 fx[1]:=0;
 For i:=2 to n do begin
  readln(f,x);
  fx[i]:=fx[i-1]+x;
  End;
 Readln(f,x);
 fx[1]:=x+fx[n];
 Close(F);
 End;

Function Cal(x,y: longint): longint;
 Begin
 Exit(min(abs(fx[j]-fx[i]),fx[1]-abs(fx[j]-fx[i])));
 End;

Procedure Try;
 Begin
 j:=1; i:=1;
 While i<=n do
  begin
  While cal(i,j+1)<cal(i,j) do inc(j);
  ans:=max(ans,cal(i,j));
  inc(i);
  End;
 Writeln(ans);
 End;



Begin
 Init;
 TRy;
End.
