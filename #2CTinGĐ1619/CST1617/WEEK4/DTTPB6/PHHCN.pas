USES MATH;
CONST FI='PHHCN.INP';
      FO='PHHCN.OUT';
      BASE=1234567890;
VAR s: array [0..21,0..21] of longint;
    f: text;


Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 While not eof(F) do
  begin
  Readln(F,m,n);
  Try;
  end;
 Close(F);
 End;


Begin
 Init;
End.
