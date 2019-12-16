CONST FI='TRIK.INP';
      FO='TRIK.OUT';

VAR S: STRING;
    ID,I: LONGINT;
    F: TEXT;
Procedure Init;
 Begin
 Assign(f,fi); reset(F);
 Readln(f,s);
 Close(F);
 End;


Procedure Try;
 Begin
 ID:=1;
 For i:=1 to length(S) do
  Begin
  Case S[i] of
  'A': If (ID=1) then ID:=2 else if Id=2 then id:=1;
  'B': If (ID=2) then Id:=3 else if id=3 then id:=2;
  'C': IF (Id=1) then ID:=3 else if id=3 then id:=1;
  end;
  end;
 Assign(F,fo); Rewrite(F);
 Writeln(f,id);
 Close(F);
 End;


Begin
 Init;
 Try;
End.