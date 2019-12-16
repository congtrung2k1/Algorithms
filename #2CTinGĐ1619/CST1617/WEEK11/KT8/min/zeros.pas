USES MATH;
CONST FI='ZEROS.INP';
      FO='ZEROS.OUT';
      MAXN=1000;
      MAXP=10000;
Type List = ARRAY [0..MAXN] OF LONGINT;
Var NT: ARRAY [0..MAXP] OF BOOLEAN;
    A,B: LONGINT;
    NB: LONGINT;
    NUM,CNT: List;
    F,G: TEXT;

Procedure Sang;
 Var i,j: Longint;
 Begin
 fillchar(NT,Sizeof(NT),True);
 NT[0]:=False; NT[1]:=False;
 For i:=2 to trunc(Sqrt(Maxp)) do
  If NT[i] then
   For j:=i to (MaxP div i) do NT[i*j]:=False;
 End;


Procedure PreCal(X: Longint; Var k: Longint;Var Num,CNT: List);
 Var j: Longint;
 Begin
 If NT[x] then
  Begin
  k:=1;
  Num[1]:=x;
  CNT[1]:=1;
  Exit;
  End;
 K:=0; j:=2;
 While X>1 do
  Begin
  If X mod j=0 then
   Begin
   If Num[k]<>j then
    Begin Inc(K); Num[k]:=j; CNT[k]:=1; end else Inc(CNT[k]);
   X:= X div j;
   End else inc(j);
  End;
 End;


Function MuPInNGT(p,n: Longint): Int64;
 Var l: longint;
     Res: Int64;
 Begin
 Res:=0; L:=p;
 While N>=L do
  Begin
  Inc(Res,N div l);
  L:=L*p;
  End;
 Exit(Res);
 End;


Function MuPInF2n(P,n: Longint):Int64;
 Var i: Longint;
     Res: int64;
 Begin
 I:=p; Res:=0;
 For i:=p to n do Res:=Res+MuPinNGT(P,i)*(n-i+1);
 Exit(Res);
 End;


Procedure Try;
 Var i: Longint;
     Res,Tmp: Int64;
 Begin
 PreCal(B,nb,Num,CNT);
 Res:=High(Int64);
 For i:=1 to nb do
  Begin
  Tmp:=MuPInF2N(Num[i],A) div CNT[i];
  Res:=Min(res,Tmp);
  End;
 Writeln(g,Res);
 End;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Sang;
 While not eof(f) do
  Begin
  Readln(f,a,b);
  try;
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.

