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
    new(tmp);
    tmp^.v:=v; tmp^.ts:=ts; tmp^.sl:=1; tmp^.link:=a[u]; a[u]:=tmp;
    new(tmp);
    tmp^.v:=u; tmp^.ts:=ts; tmp^.sl:=1; tmp^.link:=a[v]; a[v]:=tmp;
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
 If (d[heap[y]]>d[heap[y+1]]) and (y<nheap) then inc(y);
 If d[heap[y]]<d[heap[x]] then
  begin swap(heap[x],heap[y]); Downheap(y); end;
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
        d[1]:=0; push(1); kq[1]:=1;
        Repeat
        u:=pop;
        Free[u]:=False;
        tmp:=a[u];
        While tmp<>nil do begin
         v:=tmp^.v;
         If Free[v] and(d[v]>d[u]+tmp^.ts) then
           begin
           d[v]:=d[u]+tmp^.ts;
           kq[v]:=kq[u];
           push(v); end else
         IF (d[v]=d[u]+tmp^.ts) then kq[v]:=2;
         tmp:=tmp^.link;
        end;
        Until nheap=0;
End;

Procedure Try;
 Var ans,i: longint;
 Begin
 Dji(1);
 ans:=0;
 For i:=2 to n do if (kq[i]=2)then inc(ans);
 Assign(f,FO); Rewrite(F);
 Writeln(f,ans);
 ClosE(F);
 End;

Begin
 Init;
 Try;
End.

