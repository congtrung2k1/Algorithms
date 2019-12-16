CONST FI='THONGKE.INP';
      FO='THONGKE.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V,TS,SL: LONGINT; LINK: LIST; END;

VAR A: ARRAY [1..10000] OF LIST;
    D,KQ,HEAP: ARRAY [1..10000] OF LONGINT;
    FREE: ARRAY [1..10000] OF BOOLEAN;
    N,M,NHEAP: LONGINT;
    F: TEXT;

Procedure Init;
 Var tmp: list;
     u,v,ts: longint;
 Begin
 Assign(F,FI); Reset(F);
 Readln(f,n,m);
 For m:=1 to m do begin
  Readln(f,u,v,ts);
  tmp:=a[u];
  While tmp<>nil do If tmp^.v=v then break Else tmp:=tmp^.link;
  If tmp<>nil then
  begin
   If tmp^.ts=ts then inc(tmp^.sl)
    else if tmp^.ts>ts then begin tmp^.ts:=ts; tmp^.sl:=1; end;
   tmp:=a[v];
   While tmp^.v<>u do tmp:=tmp^.link;
   If tmp^.ts=ts then inc(tmp^.sl)
    else if tmp^.ts>ts then begin tmp^.ts:=ts; tmp^.sl:=1; end;
   end
   Else
   begin
    new(tmp);
    tmp^.v:=v; tmp^.ts:=ts; tmp^.sl:=1; tmp^.link:=a[u]; a[u]:=tmp;
    new(tmp);
    tmp^.v:=u; tmp^.ts:=ts; tmp^.sl:=1; tmp^.link:=a[v]; a[v]:=tmp;
   end;
 end;
 End;

PROCEdure Swap(VAR x,y: longint);
 Var tmp: longint;
 Begin
 tmp:=x; x:=y; y:=tmp;
 End;
Procedure Upheap(x: longint);
 Begin
 If (x=1) or (d[heap[x]]>d[heap[x div 2]]) then exit;
 Swap(heap[x],heap[x div 2]);
 Upheap(x div 2);
 End;

Procedure Downheap(x: longint);
 Var y: longint;
 Begin
 If x*2>nheap then exit;
 y:=x*2;
 If d[heap[y]]>d[heap[y+1]] then inc(y);
 If d[heap[y]]<d[heap[x]] then
  swap(heap[x],heap[y]);
 Downheap(y);
 End;

Function Pop: longint;
 Begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 Downheap(1);
 End;

Procedure Push(x: longint);
 Begin
 inc(nheap);
 heap[nheap]:=x;
 Upheap(nheap);
 End;

Procedure Dji(x: longint);
Var minm,u,v,I:Longint;
    tmp:list;
Begin
        For i:=1 to n do d[i]:=maxlongint;
        Fillchar(free,sizeof(free),true);
        d[x]:=0; push(x); kq[x]:=1;
        Repeat
        u:=pop;
        Free[u]:=False;
        tmp:=a[u];
        While tmp<>nil do begin
         If Free[tmp^.v]and(d[tmp^.v]>d[u]+tmp^.ts) then
           begin
           d[tmp^.v]:=d[u]+tmp^.ts;
           kq[tmp^.v]:=kq[u]*tmp^.sl;
           push(tmp^.v);end else
         IF d[tmp^.v]=d[u]+tmp^.ts then kq[tmp^.v]:=kq[u]+kq[tmp^.v]*tmp^.sl;
         tmp:=tmp^.link;
        end;
        Until nheap=0;
End;

Procedure Try;
 Var ans,i: longint;
 Begin
 Dji(1);
 ans:=0;
 For i:=1 to n do
  if (kq[i]>=2) and (d[i]<>maxlongint) then inc(ans);
 Assign(f,FO); Rewrite(F);
 Writeln(f,ans);
 ClosE(F);
 End;

Begin
 Init;
 Try;
End.

