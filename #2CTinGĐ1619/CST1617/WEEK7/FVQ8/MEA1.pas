USES MATH;
CONST FI='MEA.INP';
      FO='MEA.OUT';

VAR L,R,ANT,ACT,N,I: LONGINT;
    F: TEXT;

PROCEdure TRY;
 BEGIN
 Assign(f,FI); ReseT(F);
 Readln(F,n);
 l:=MAxlongint; R:=-maxlongint;
 For I:=1 to n do
  begin
  readln(f,act);
  Act:=act*2;
  Act:=Act-ant;
  If not odd(i) then l:=Min(l,(Act-ant)DIV 2)
   else R:=Max(r,(Ant-Act) DIV 2);
  Ant:=Act;
  End;
 Close(F);
 Assign(f,FO); Rewrite(F);
 If (r<=l) then Writeln(f,l-r+1) else Writeln(f,0);
 Close(F);
 End;

Begin
 TRY;
End.
