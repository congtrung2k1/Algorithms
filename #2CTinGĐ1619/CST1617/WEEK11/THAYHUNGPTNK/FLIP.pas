CONST FI='FLIP.INP';
      FO='FLIP.OUT';


VAR N,M: LONGINT;
    HEAP,A,B,POS,D,ANS: ARRAY [0..200005] OF LONGINT;
    F,G: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(F,n,m);
 For i:=1 to n do
  Begin
  Readln(f,A[i],B[i]);
  Pos[i]:=i;
  Push(A[i]); D[i]:=1;
  End;
 Close(F); Close(G);
 End;



