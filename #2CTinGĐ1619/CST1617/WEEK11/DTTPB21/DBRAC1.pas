Uses Math;
CONST FI='DBRAC1.INP';
      FO='DBRAC1.OUT';
      MAXN=32*2+5;
VAR FX: ARRAY [0..MAXN,0..MAXN,0..MAXN] OF Int64;
    N,K: LONGINT;
    Res: Int64;
    F,G: TEXT;

Function Cal(i,c,MaxC: Longint): Int64;
 Var sl: Int64;
 Begin
 If Fx[i,c,maxC]>-1 then Exit(Fx[i,c,MaxC]);
 If I>N Then
  If (MaxC=K) And (C=0) Then
   Begin Write(1); Exit(1); End
    Else Begin Write(0); Exit(0); End;
 SL:=0;
 If C<K Then Sl:=Sl+Cal(i+1,c+1,Max(MaxC,C+1));
 If C>0 Then Sl:=Sl+Cal(I+1,C-1,Max(MaxC,C-1));
 Fx[i,c,maxC]:=SL;
 Exit(sl);
 End;

Procedure Khoitao;
 Var i,j,u: Longint;
 Begin
 For i:=0 to n+1 do
  For j:=0 to k+1 do
   For u:=0 to k+1 do Fx[i,j,u]:=-1;
 End;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 While not eof(F) do
  Begin
  Readln(f,n,k);
  n:=n*2;
  Khoitao;
  Res:=Cal(1,0,0);
  Writeln(g,Res);
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.


