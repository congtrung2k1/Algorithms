CONST FI='QUACAU.INP';
      FO='QUACAU.OUT';

VAR Q: ARRAY [0..2000000] OF LONGINT;
    SUM: ARRAY [0..1000000] OF LONGINT;
    ANS,TD,TC,L,N,B: LONGINT;
    C: CHAR;

Procedure Try;
 Begin
 Front:=1; Rear:=L;
 Repeat

 Until (Q[Front]=N-L) And (Q[Rear]=N) And (TD=N) And (TC=N-B);
 End;

PROCEdure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  Readln(f,l,b,n);
  For i:=1 to l do Q[l]:=i;
  For n:=1 to n do Begin
   Read(f,C);
   If C='1' then Sum[N]:=Sum[N-1]+1 Else Sum[N]:=Sum[N-1];
   End;
  TD:=1; TC:=B;
  End;
 Close(F);
 End;



Begin
 Init;
End.

