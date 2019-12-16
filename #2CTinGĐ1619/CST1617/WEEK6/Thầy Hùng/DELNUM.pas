CONST FI='DELNUM.INP';
      FO='DELNUM.OUT';

VAR STACK: ARRAY [0..10006] OF LONGINT;
    N,ANS,X,TOP: LONGINT;
    F: TEXT;


Procedure Push(x: longint);
 Begin
 Inc(top);
 Stack[top]:=x;
 End;

Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n); TOP:=0;
 For n:=1 to n do
  Begin
  Read(f,x);
  If top>=2 then
  While (top>=2) and (x>Stack[top]) And (Stack[top]<Stack[top-1])
   do Dec(top);
  Push(x);
  End;
 Close(F);
 Assign(f,FO); Rewrite(F);
 Writeln(f,top);
 Close(F);
 End;


Begin
 Init;
End.
