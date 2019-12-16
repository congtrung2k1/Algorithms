USES MATH;
CONST FI='TRANSPO.INP';
      FO='TRANSPO.OUT';
Type list=^node;
     node=record
    v,ts: longint; link:list; end;
VAR A:ARRAY [1..50000] OF LIST;
    N,M,ts,R,L,ANS,c: LONGINT;
    F: Text;


PRocedure Init;
 Var tmp:list;
     u,v,w: longint;
 Begin
 Assign(f,FI); Reset(F);
 Readln(F,n,m);
 For n:=1 to n do a[n]:=nil;
 r:=0;
 For m:=1 to m do
  begin
  Readln(f,u,v,ts);
  r:=max(r,ts);
  tmp:=a[u];
  While tmp<>nil do If tmp^.v=v then break Else tmp:=tmp^.link;
  If tmp<>nil then
   begin
   tmp^.ts:=max(tmp^.ts,ts);
   tmp:=a[v];
   While tmp^.v<>u do tmp:=tmp^.link;
   tmp^.ts:=max(tmp^.ts,ts);
   end
   Else
   begin
   new(tmp);
   tmp^.v:=v;tmp^.ts:=ts;tmp^.link:=a[u];a[u]:=tmp;
   new(tmp);
   tmp^.v:=u;tmp^.ts:=ts;tmp^.link:=a[v];a[v]:=tmp;
   end;
  end;
 Close(F);
End;

Function Check(x: longint):boolean;
 Var queue: array [1..100000] of longint;
     free: array [1..10000] of boolean;
     front,rear,u,v: longint;
     tmp: list;
 Begin
 Fillchar(free,sizeof(free),false);
 queue[1]:=1; front:=1; rear:=1;
 free[1]:=true;
 Repeat
 u:=queue[front]; inc(front); free[u]:=false;
 tmp:=a[u];
 If u=n then exit(true);
 While tmp<>nil do begin
  v:=tmp^.v;
  c:=tmp^.ts;
  If (not free[v]) and (tmp^.ts<=x) then
   begin inc(rear); queue[rear]:=v; end;
  tmp:=tmp^.link;
  End;
 Until front>rear;
 Exit(false);
 End;

PRocedure Try;
 Begin
 l:=1; ans:=0;
 Repeat
 m:=(l+r) div 2;
 IF Check(m) then begin l:=m+1; ans:=max(ans,m) end
  else r:=m-1;
 Until l>r;
 Assign(F,FO); Rewrite(F);
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
