Uses math;
Const FI='SUMGAME.INP';
      FO='SUMGAME.OUT';

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
Procedure Lay(Var x,y,t: longint);
 Begin
 IF abs(a[x]-a[x+1])=abs(a[y]-a[y-1]) then
  if (a[x+1]>a[y-1]) then begin t:=t+a[y]; dec(y); exit; end
   else begin t:=t+a[x]; inc(x); exit; end;
 If a[x+1]<a[y-1] then begin t:=t+a[x]; inc(x); exit; end
  else begin t:=t+a[y]; dec(y); exit; end;
 End;

Procedure Try;
Var t1,t2 : LongInt;
 Begin
 I:=1; j:=N; t1:=0; t2:=0;
 Repeat
 Lay(i,j,t1);
 Lay(i,j,t2);
 Until j-i<=2;
 T1:=t1+max(a[i],a[j]);
 T2:=t2+min(a[i],a[j]);
 Assign(F,fO); Rewrite(f);
 Writeln(f,t1);
 Writeln(f,t2);
 Close(f);
 End;


Begin
 Init;
 Try;
End.
