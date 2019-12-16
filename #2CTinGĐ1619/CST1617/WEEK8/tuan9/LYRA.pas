CONST FI='LYRA.INP';
      FO='LYRA.OUT';
Type List=ARRAY [0..100005] OF LONGINT;

VAR S1,S2: LIST;
    ANS,N,T: LONGINT;
    S: ANSISTRING;
    F: TEXT;


Procedure Tru(Var X:List);
 Var Tam,k: Longint;
 Begin
 Tam:=1;
 For k:=T downto 1 do
  Begin
  X[T]:=X[T]-tam;
  If X[T]=-1 then Begin X[T]:=0; Tam:=1; end
   else tam:=0;
  end;
 End;

Procedure Cong(Var X:List);
 Var Tam,k: Longint;
 Begin
 Tam:=1;
 For k:=T Downto 1 do
  Begin
  X[T]:=X[T]+Tam;
  If X[T]=2 then Begin X[T]:=0; Tam:=1; end
   else Tam:=0;
  end;
 end;

Procedure Khoitao(X: List);
 Var i: Longint;
 Begin
 T:=0; N:=Length(S);
 For I:=1 to n do
  Case S[i] of
  '1': Begin Inc(T); X[T]:=0; End;
  '2': Begin Inc(T); X[T]:=1; End;
  'L': Tru(X);
  'R': Cong(X);
  'U': Dec(T);
  End;
 X[0]:=T;
 end;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,s);
 Khoitao(s1);
 Readln(f,s);
 Khoitao(s2);
 Close(F);
 End;



Begin
 Init;
End.