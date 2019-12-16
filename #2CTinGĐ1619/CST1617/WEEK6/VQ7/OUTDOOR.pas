Uses math;
CONST FI='OUTDOOR.INP';
      FO='OUTDOOR.OUT';

VAR I,J,U,V,N,K,M,TMP: LONGINT;
    SUM: ARRAY[0..500] OF LONGINT;
    FX,A: ARRAY [0..500,0..500] OF LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 REadln(F,n,k,m);
 For m:=1 to m do begin
  REadln(F,u,v);
  If u>v then begin tmp:=u; u:=v; v:=tmp; END;
  For i:=1 to u do
   For j:=v to n do inc(A[i,j]);
  End;
 Close(F);
 End;


PRocedure TRy;
 Begin
 FX[0,0]:=0;
 For i:=1 to k do FX[0,i]:=-maxlongint;
 For i:=1 to n do FX[i,0]:=-maxlongint;
 For i:=1 to n do
  For j:=1 to k do
   Begin
   Fx[i,j]:=FX[0,j-1]+A[1,i];
   For m:=2 to I-2 do
    FX[i,j]:=Max(Fx[i,j],Fx[m,j-1]+A[m+1,i]);
   End;
 Assign(F,fO); Rewrite(F);
 Writeln(f,FX[n,k]);
 Close(F);
 End;


Begin
 Init;
 Try;
End.


