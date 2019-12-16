USES MATH;
CONST FI='LYRA.INP';
      FO='LYRA.OUT';

VAR S1,S2: ANSISTRING;
    D,VT: ARRAY [0..100000] OF LONGINT;
    A,B,TA,TB,T,TMP,ANS,T1,T2: INT64;
    I: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fI); Reset(F);
 Readln(f,s1);
 Readln(F,s2);
 Close(F);
 End;


Procedure Try;
 Begin
 A:=1; TA:=1;
 For i:=1 to length(s1) do
  Case S1[i] of
  '1': BEGIN A:=2*A; INC(TA); END;
  '2': BEGIN A:=2*A+1; INC(TA); END;
  'U': BEGIN A:=A Div 2; DEC(TA); END;
  'R': Inc(A);
  'L': Dec(A);
  end;
 B:=1; TB:=1;
 For i:=1 to length(s2) do
  Case S2[i] of
  '1': BEGIN B:=2*B; INC(TB); END;
  '2': BEGIN B:=2*B+1; INC(TB); END;
  'U': BEGIN B:=B Div 2; DEC(TB); END;
  'R': Inc(B);
  'L': Dec(B);
  end;
 ANS:=ABS(TA-TB);
 IF TA>TB THEN
  Repeat A:=A Div 2; Dec(Ta); Until TA=TB;
 IF TB>TA THEN
  Repeat B:=B Div 2; Dec(TB); Until TB=TA;
 TMP:=MAX(A,B); T:=0;
 Repeat
 Inc(T); VT[T]:=TMP DIV 2; D[T]:=D[T-1]+1; Tmp:=Tmp div 2;
 Until TMP=1;
 TMP:=MIN(A,B); I:=0;
 Repeat
 Inc(T2);
 For i:=1 to T do
  IF VT[i]=TMP Then Begin T1:=D[i]; Break; End;
 Tmp:=Tmp Div 2;
 Until Tmp=0;
 Ans:=Ans+Min(Abs(A-B),T2+T1);
 Writeln(Ans);
 End;



Begin
 Init;
 Try;
End.
