//Cao Nguyet Minh
USES MATH;
CONST FI='JUMP.INP';
      FO='JUMP.OUT';
      MAXN=1001;

VAR A,QUEUE,QUEUE1,D: ARRAY [-1001..1001] OF LONGINT;
    FREE: ARRAY [0..1001] OF BOOLEAN;
    B: ARRAY [-1000..1001,-1000..1001] OF LONGINT;
    F: TEXT;
    N,U,V,ANS,SOLUONG,SOLUONG1,DAU,DAU1,CUOI,CUOI1,DX: LONGINT;


Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(F,n);
 For n:=1 to n do readln(f,a[n]);
 Close(F);
 End;

Function PopQueue:Longint;
Begin
	PopQueue:=queue[dau];
	dec(soluong);
	if dau=maxN then dau:=1
	else inc(dau);
End;

Function PopQueue1:Longint;
Begin
	PopQueue1:=queue1[dau1];
	dec(soluong1);
	if dau1=maxN then dau1:=1
	else inc(dau1);
End;

Procedure PushQueue(v:integer);
Begin
	inc(soluong);
	if cuoi=maxN then cuoi:=1
	else inc(cuoi);
	queue[cuoi]:=v;
End;

Procedure PushQueue1(v:integer);
Begin
	inc(soluong1);
	if cuoi1=maxN then cuoi1:=1
	else inc(cuoi1);
	queue1[cuoi1]:=v;
End;

procedure SPFA(s:integer);
var
  i, u, v: Integer;
begin
 for v := 1 to n do begin d[v] := maxlongint; free[v]:=true;
	End;
 dau:=1; cuoi:=1; soluong:=1;
 queue[1]:=s; d[s]:=0; free[s]:=false;
 dau1:=1; cuoi1:=1; soluong1:=1;
 queue1[1]:=0;
 repeat
 u:=PopQueue; dx:=popqueue1; free[u]:=true;
 V:=u+dx+1;
 if (d[v]>d[u]+a[v]) and (v<=n) then
  Begin
  d[v]:=d[u]+a[v];
  if free[v] then begin PushQueue(v);
                        PushQueue1(dx+1);
                        free[v]:=false;
			End;
  End;
 v:=u-dx;
 If (d[v]>d[u]+a[v]) and (v>0) then
  begin
  d[v]:=d[u]+a[v];
  If free[v] then begin pushqueue(v);
                        pushqueue1(dx);
                        free[v]:=false;
                        end;
  End;
 until soluong=0;
end;

Procedure Try;
 Begin
 spfa(1);
 Assign(f,FO); Rewrite(F);
 Writeln(f,d[n]);
 Close(F);
 End;

BEgin
 Init;
 Try;
End.

