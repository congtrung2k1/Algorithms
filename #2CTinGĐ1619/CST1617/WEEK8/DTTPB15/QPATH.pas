CONST FI='QPATH.INP';
      FO='QPATH.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V: LONGINT; LINK:LIST; END;
Var A: ARRAY [0..1005] OF LIST;
    N,K,I,J: LONGINT;
    TMP: LIST;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n); Readln(f,k);
 For i:=1 to n do A[i]:=Nil;
 For i:=1 to n do
  Repeat
  New(tmp);
  Read(f,v); If V=0 then Break;
  Tmp^.V:=V; Tmp^.link:=A[i]; A[i]:=Tmp;
  Until V=0;
 Close(F);
 End;

Procedure Try;
 Begin
 End;


Begin
 Init;
 Try;
End.

