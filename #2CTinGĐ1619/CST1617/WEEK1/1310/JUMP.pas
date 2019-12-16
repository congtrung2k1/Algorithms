//Cao Nguyet Minh
USES MATH;
CONST FI='JUMP.INP';
      FO='JUMP.OUT';

VAR A,Dx,D: ARRAY [0..1001] OF LONGINT;
    B: ARRAY [0..1001,0..1001] OF LONGINT;
    F: TEXT;
    N,U,V,ANS,SL: LONGINT;


Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(F,n);
 For n:=1 to n do readln(f,a[n]);
 Close(F);
 End;



PRocedure BFS;
 Var queue: array [0..1000000] of longint;
     front,rear: longint;
 Begin
 For n:=1 to n do d[n]:=maxlongint;
 d[1]:=0; d[2]:=a[2];
 front:=2; rear:=2; dx[1]:=1; dx[2]:=1;
 queue[1]:=1; queue[2]:=2;
 Repeat
 u:=queue[front];
 v:=u+dx[front]+1;
 If v<=n then begin
   inc(sl);
   if rear=1000 then rear:=1 else inc(rear);
   queue[rear]:=v; d[rear]:=d[front]+a[v]; dx[rear]:=dx[front]+1;
   end;
 If v=n then begin ans:=min(ans,d[rear]); end;
 IF u-dx[front]>0 then begin
  begin
   if rear=1000 then rear:=1 else inc(rear);
   inc(sl);
   queue[rear]:=u-dx[front];
   d[rear]:=d[front]+a[u-dx[front]]; dx[rear]:=dx[front];
  end;
 end;
 dec(sl);
 if front=1000 then front:=1 else inc(front);
 Until sl<=0;
 End;


Procedure Try;
 Begin
 ans:=maxlongint;
 BFS;
 Assign(F,FO); rewrite(f);
 Writeln(f,ans);
 Close(F);
 End;


Procedure Khoitao;
 Var i: longint;
 Begin
 Assign(f,FI); Rewrite(F);
 Writeln(f,1000);
 For i:=1 to 1000 do writeln(f,i);
 Close(F);
 End;

BEgin
// Khoitao;
 Init;
 Try;
End.

