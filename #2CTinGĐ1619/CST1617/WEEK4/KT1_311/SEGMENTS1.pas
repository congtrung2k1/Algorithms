// Cao Nguyet Minh
CONST FI='SEGMENTS.INP';
      FO='SEGMENTS.OUT';
Type  td= record
      x,y: longint;
      end;

VAR A: array [1..100000] of td;
    FX: array [1..100000] Of longint;
    F: text;
    N,I,J: LONGINT;

Procedure Init;
 Begin
 Assign(f,FI); REset(F);
 REadln(f,n);
 For n:=1 to n do with a[n] do
  readln(F,x,y);
 Close(F);
 End;


PRocedure Try;
 Begin
 If n<=5000 then
  begin
  For i:=1 to n do
   For j:=1 to n do
    if (i<>j) and (A[i].x>=a[j].x) and (a[i].y<=a[j].y) then
     if (fx[i]<>0) then begin
      if (a[fx[i]].x<a[j].x) then fx[i]:=j; end
     else fx[i]:=j;
  End;
 Assign(F,FO); REwrite(F);
 For n:=1 to n do writeln(f,fx[n]);
 Close(F);
 End;




Begin
 Init;
 Try;
End.


