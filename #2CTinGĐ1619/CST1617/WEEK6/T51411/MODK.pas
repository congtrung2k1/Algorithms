USES MATH;
CONST FI='MODK.INP';
      FO='MODK.OUT';
      BASE=44444444;
      Inf=-100000000;
VAR A: ARRAY [0..10000] OF LONGINT;
    FX: ARRAY [0..10000,0..11] OF INT64;
    N,K,I,J: LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Readln(f,n,k);
 For n:=1 to n do read(F,a[n]);
 Close(F);
 End;

Function ModX(x,j: longint):int64;
 Begin
 If x>j then exit(j+k-x) else exit(j-x);
 End;

Procedure Try;
 Var d: longint;
 Begin
 Fx[0,0]:=0;
 For i:=1 to n do begin
  Fx[i,ModX(a[i],k)]:=Fx[i-1,ModX(a[i],k)]+1;
  For j:=0 to k-1 do
   Fx[i,j]:=ModX(Fx[i,j]+MODX(Fx[i-1,j],Base),Base);
  End;
 For i:=1 to n do
  for j:=0 to k-1 do
   begin
   d:=((j*(10 mod k)) mod k + A[i] mod k) Mod k ;
   Fx[i,d]:=(fx[i-1,j]+fx[i,d]) MOD BASE;
   End;
 Assign(f,FO); Rewrite(F);
 Writeln(f,Fx[n,0]);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
