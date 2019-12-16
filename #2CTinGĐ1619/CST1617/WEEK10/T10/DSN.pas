CONST FI='DSN.INP';
      FO='DSN.OUT';

VAR I,J,N,TOP: LONGINT;
    STACK,A,FIND: ARRAY [0..100005] OF LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(f);
 Readln(f,n);
 For n:=1 to n do Readln(F,a[n]);
 Close(F);
 End;


Procedure Try;
 Begin
 Top:=1; Stack[1]:=1;
 For i:=2 to n do
  Begin
  While Top>0 do
   If A[Stack[Top]]<A[i] Then Begin Find[Stack[Top]]:=i; Dec(Top); End else break;
  Inc(Top); Stack[top]:=i;
  End;
 Assign(f,fo); Rewrite(F);
 For i:=1 to n do Writeln(f,Find[i]);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
