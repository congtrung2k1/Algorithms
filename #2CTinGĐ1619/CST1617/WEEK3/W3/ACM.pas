Uses math;
CONST FI='ACM.INP';
      FO='ACM.OUT';

VAR dp,x: array [0..3,0..30000] of longint;
  //  x,y,z: array [1..30000] of longint;
    b: array [1..4] of boolean;
    a: array [0..4] of longint;
    n,i,j,ans: longint;
    f: text;


Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Fillchar(b,sizeof(b),true);
 Readln(f,n);
 For i:=1 to 3 do begin
  For j:=1 to n do begin
   read(f,x[i,j]);
   x[i,j]:=x[i,j-1]+x[i,j];
   end;
  readln(f);
 end;
 ans:=maxlongint;
 Close(F);
 end;


Procedure Try;
 Var i,j,tmp: longint;
 Begin
 dp:=x;
 tmp:=maxlongint;
 a[4]:=4;
 For i:=1 to 3 do
  For j:=1 to n do
   dp[i,j]:=min(dp[a[i],j-1],dp[a[i-1],j-1])+dp[i,j];
 tmp:=min(tmp,dp[a[3],n]);
 if ans>tmp then ans:=tmp;
 End;

Procedure Hoanvi(k:Byte);
Var i:Byte;
Begin
If(k>3) then Try
 Else
 For i:=1 to 3 do
  begin
  If (b[i]) then
   begin
   b[i]:=False;
   a[k]:=i;
   Hoanvi(k+1);
   b[i]:=True;
   end;
 end;
End;



Begin
 Init;
 Hoanvi(1);
 Writeln(ans);
End.