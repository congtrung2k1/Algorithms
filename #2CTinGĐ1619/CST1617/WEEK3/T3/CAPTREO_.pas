CONST FI='CAPTREO.INP';
      FO='CAPTREO.OUT';
      INF =1000000;
VAR N,M,I,J: LONGINT;
    A: ARRAY [1..1001,1..1001] OF LONGINT;
    FREE: ARRAY [1..1001] OF BOOLEAN;
    D: ARRAY [1..1001] OF LONGINT;
    F: TEXT;


PROCEDURE INIT;
 VAR u,v: longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m);
 For m:=1 to m do begin readln(F,u,v); a[v,u]:=1; a[u,v]:=1; end;
 Close(F);
 End;


Function Cal (x,y : Integer) : LongInt;
 Var current,t,tmp : LongInt;
 Begin
 current:=d[x]; tmp:=0;
 If y<x then t:=4*(x-y);
 If x<y then
  Begin
  If current<2*(y-x) then tmp:=2*(y-x);
  If current>2*(y-x) then t:=4*(y-x);
  End;
  If tmp<>0 then exit((tmp-current)+2*abs(x-y));
 For j:=0 to 32000 do
  If (t*j)>=current then
   Begin
   tmp:=(t*j)-current;
   break;
   End;
 tmp:=tmp+2*abs(x-y);
 Exit(tmp);
 End;

Procedure dji(x: longint);
 Var u,i,TMP: longint;
 Begin
 Fillchar(free,sizeof(Free),true);
 For i:=1 to n do d[i]:=inf;
 d[n]:=0;
 Repeat
 tmp:=inf;
 For i:=1 to n do
  if (d[i]<tmp) and (free[i]) then begin u:=i; tmp:=d[i]; end;
 If tmp=inf then break;
 Free[u]:=false;
 For i:=1 to n do
  if free[i] then
   if (a[u,i]=1) then
    if (d[u]+cal(u,i)<d[i]) then d[i]:=d[u]+cal(u,i);
 Until false;
 End;


PRocedure Try;
 BEgin
 Dji(n);
 Assign(F,FO); Rewrite(F);
 Writeln(F,d[1]);
 ClosE(F);
 End;


BEgin
 Init;
 Try;
End.



