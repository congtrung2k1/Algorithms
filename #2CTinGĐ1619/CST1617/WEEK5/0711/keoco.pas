Uses math;
Const FI='KEOCO.INP';
      FO='KEOCO.OUT';

VAR a: array [0..1000] of longint;
    d: array [0..1000,0..1000] of longint;
    n,i,k,j,sum: longint;
    f: text;

Procedure Init;
 Begin
 Assign(F,fI); reset(F);
 Readln(f,N);
 sum:=0;
 For i:=1 to n do begin Readln(f,a[i]); inc(sum,a[i]); end;
 Close(F);
 End;

Procedure Try;
Var t1,t2 : LongInt;
 Begin
 For i:=0 to N+1 do
  For j:=0 to (sum div 2)+1 do D[i,j]:=0;
 For i:=1 to N do
  For j:=1 to sum div 2 do
   if A[i]>j then D[i,j]:=D[i-1,j]
    else D[i,j]:=max(D[i-1,j],D[i-1,j-A[i]]+A[i]);
 t1:=sum-D[N,sum div 2];
 t2:=D[N,sum div 2];
 Assign(f,FO); rewrite(f);
 If t1<=t2 then Writeln(f,t1,' ',t2) else Writeln(f,t2,' ',t1);
 Writeln(f);
 Close(f);
 End;

Begin
 Init;
 Try;
End.
