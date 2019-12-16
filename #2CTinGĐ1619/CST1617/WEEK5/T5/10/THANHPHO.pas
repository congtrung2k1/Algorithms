Uses Math;
CONST FI='THANHPHO.INP';
      FO='THANHPHO.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V: LONGINT; LINK: LIST; END;
Var a: array [1..20005] of List;
    Ra,Vao,T,Number,Low,stack: array [1..20005] of longint;
    Free: array [0..20005] of Boolean;
    m,n,TPLT,top,count: longint;
    F: text;


Procedure Init;
 Var u,v: longint;
     tmp: list;
 Begin
 Assign(f,FI); reset(F);
 Readln(f,n,m);
 For n:=1 to n do a[n]:=nil;
 For m:=1 to m do
  begin
  Readln(f,u,v);
  new(tmp);
  tmp^.v:=v; tmp^.link:=a[u]; a[u]:=tmp;
  End;
 Close(F);
 End;

PRocedure Khoitao;
 Begin
 Fillchar(number,sizeof(number),0);
 Fillchar(free,sizeof(free),true);
 Top:=0;
 Count:=0;
 TPLT:=0;
 End;

Procedure Push(v: longint);
 Begin
 Inc(top); Stack[top]:=v;
 End;

Function Pop: longint;
 Begin
 Pop:=Stack[top];
 Dec(top);
 End;

Procedure Visit(u: longint);
 Var v: longint;
     tmp: list;
 Begin
 Inc(count); Number[u]:=count;
 Low[u]:=number[u];
 Push(u);
 tmp:=a[u];
 While tmp<> nil do
  begin
  v:=tmp^.v;
  If Free[v] then
   If number[v]<>0 then Low[u]:=min(low[u],number[v])
    else
     begin
     visit(V);
     Low[u]:=min(low[u],low[v]);
     End;
  Tmp:=tmp^.link;
  End;
  If number[u]=low[u] then
   begin
   Inc(TPLT);
   Repeat
   v:=pop;
   Free[v]:=false; Writeln(V,' ',tplt);
   T[v]:=tplt;
   Until v=u;
   End;
 End;

Procedure Try;
 Var u,v,i,kq1,kq2: longint;
     tmp: list;
 Begin
 For u:=1 to n do
  If number[u]=0 then visit(u);
 For u:=1 to n do
  begin
  tmp:=a[u];
  While tmp<>nil do
   begin
   v:=tmp^.v;
   If T[v]<>T[u] then Begin inc(Ra[t[u]]); Inc(Vao[t[v]]); end;
   Tmp:=tmp^.link;
   End;
  End;
 Assign(f,FO); Rewrite(F);
 kq1:=0; kq2:=0;
 If tplt=1 then writeln(f,0) else
 begin
 For i:=1 to tplt do
  if (Ra[i]=0) then inc(kq1);
 For i:=1 to tplt do
  IF (vao[i]=0) then inc(kq2);
 Writeln(f,max(kq1,kq2));
 end;
 Close(F);
 End;



Begin
 Init;
 Khoitao;
 Try;
End.


