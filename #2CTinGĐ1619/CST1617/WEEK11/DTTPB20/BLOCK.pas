Uses Math;
CONST FI='BLOCK.INP';
      FO='BLOCK.OUT';

VAR A,B: ARRAY [0..205] OF LONGINT;
    N,T: Longint;
    Fx: ARRAY [0..205,0..205,0..205] OF LONGINT;
    F,G: TEXT;

function dp(x,y,k:longint):longint;
var i:longint;
begin
 if fx[x,y,k]>=0 then exit(fx[x,y,k]);
 if x=y then exit((b[x]+k)*(b[x]+k));
 fx[x,y,k]:=dp(x,y-1,0)+(b[y]+k)*(b[y]+k);
 for i:=x to y-1 do
  if a[i]=a[y] then
  fx[x,y,k]:=max(fx[x,y,k],dp(x,i,b[y]+k)+dp(i+1,y-1,0));
 exit(fx[x,y,k]);
end;

Procedure Init;
 Var Tmp,x,Test: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  Fillchar(Fx,sizeof(fx),255);
  Readln(f,n); Tmp:=0; T:=0;
  For n:=1 to n do
   Begin
   Read(f,x);
   If x=Tmp then Inc(B[T]) Else
    Begin Inc(T); A[T]:=x; B[T]:=1; Tmp:=x; End;
   End;
  Writeln(g,Dp(1,T,0));
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.



