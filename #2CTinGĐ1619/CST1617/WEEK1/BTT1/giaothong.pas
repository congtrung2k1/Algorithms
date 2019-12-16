Uses math;
Const FI='GIAOTHONG.INP';
      FO='GIAOTHONG.OUT';

VAR
    A: ARRAY [1..10000,1..10000] OF BOOLEAN;
    Free: array [1..10000] of boolean;
    Number,low: array [1..10000] of longint;
    stack: array [1..10000] of record u,v: longint; end;
    n, count, cc, top, m, x, y, tmp, ans: longint;
    f: text;


PRocedure Init;
 Var u,v: longint;
 Begin
 Fillchar(a,sizeof(a),false);
 Assign(F,FI); Reset(F);
 Readln(f,n,m);
 For m:=1 to m do begin
                  readln(F,u,v);
                  a[u,v]:=true;
                  a[v,u]:=true;
                  end;

 Close(f);
 End;


Procedure Khoitao;
 Begin
 Fillchar(number,sizeof(number),0);
 Fillchar(free,sizeof(free),true);
 top:=0;
 count:=0;
 cc:=0;
 End;


PRocedure Push(u,v: longint);
 BEgin
 Inc(top);
 stack[top].u:=u; stack[top].v:=v;
 End;

Procedure pop(Var x,y: longint);
 Begin
 X:=stack[top].u;
 Y:=stack[top].v;
 Dec(top);
 End;

PRocedure Visit(u: longint);
 Var v,t : longint;
 Begin
 Inc(count); number[u]:=count;
 low[u]:=number[u];
 For v:=1 to n do begin
  if (free[v]) and (a[u,v]) then
   begin
   a[v,u]:=false; push(u,v);
   If number[v]<>0 then low[u]:=min(low[u],number[v])
    else
    begin
    visit(v);
    low[u]:=min(low[u],low[v]);
    end;
  tmp:=0;
  if low[v]>=number[u] then
   begin
   repeat
   pop(x,y); inc(tmp);
   Free[x]:=false;
   Until (x=u) and (y=v);
   if tmp>ans then ans:=tmp;
   End;
   end;
  End;
 End;


Procedure Try;
 Var u: longint;
 Begin
 ans:=0;
 For u:=1 to n do
  if number[u]=0 then visit(u);
 Assign(F,FO); Rewrite(F); Writeln(f,ans); ClosE(F);
 End;


BEgin
 Init;
 Khoitao;
 try;
 End.

