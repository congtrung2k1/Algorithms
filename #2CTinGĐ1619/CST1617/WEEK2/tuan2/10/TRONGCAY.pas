CONST FI='TRONGCAY.INP';
      FO='TRONGCAY.OUT';


Type list=^node;
     node= record
     v,TS: longint; link: list; end;

VAR  a: array [1..10000] of list;
     free: array [1..10000] of boolean;
     d,num,heap,pos: array [1..10000] of longint;
     sl,pre,c: array [1..10000,1..10000] of longint;
     n,m,u,v,ts,swap,nheap,i,vt,ans: longint;
     f: text;


Procedure Init;
 Var tmp: list;
 Begin
 Assign(f,FI); Reset(F);
 Readln(F,n,m);
 For n:=1 to n do a[n]:=nil;
 For m:=1 to m do begin
  Readln(f,u,v,ts);
  inc(u); inc(v);
  tmp:=a[u];
  While tmp<>nil do If tmp^.v=v then break Else tmp:=tmp^.link;
  If tmp<>nil then begin
   if tmp^.ts=ts then inc(sl[u,v]);
   if tmp^.ts>ts then begin tmp^.ts:=ts; c[u,v]:=ts; sl[u,v]:=1; end;
   tmp:=a[v];
   While tmp^.v<>u do tmp:=tmp^.link;
   if tmp^.ts=ts then inc(sl[v,u]);
   if tmp^.ts>ts then begin c[v,u]:=ts; tmp^.ts:=ts; sl[v,u]:=1; end;
   end
   Else begin new(tmp);
              tmp^.v:=v;tmp^.ts:=ts;tmp^.link:=a[u]; a[u]:=tmp; sl[u,v]:=1;
              c[u,v]:=ts;
              new(tmp);
              c[v,u]:=ts;
              tmp^.v:=u;tmp^.ts:=ts;tmp^.link:=a[v]; a[v]:=tmp; sl[v,u]:=1;
        end;
   End;
  Close(F);
  End;


Procedure Up (x : LongInt);
    Begin
        if x=1 then exit;
        if D[Heap[x]]>D[Heap[x div 2]] then exit;
        swap:=Heap[x]; Heap[x]:=Heap[x div 2]; Heap[x div 2]:=swap;
        Pos[Heap[x]]:=x;
        Pos[Heap[x div 2]]:=x div 2;
        Up(x div 2);
    End;

Procedure Down (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if y>nHeap then exit;
        if (y<nHeap) and (D[Heap[y]]>D[Heap[y+1]]) then inc(y);
        if D[Heap[x]]>D[Heap[y]] then
            Begin
                swap:=Heap[x]; Heap[x]:=Heap[y]; Heap[y]:=swap;
                Pos[Heap[x]]:=x;
                Pos[Heap[y]]:=y;
                Down(y);
            End;
    End;

Function Pop : LongInt;
    Begin
        Pop:=Heap[1];
        Heap[1]:=Heap[nHeap];
        Pos[Heap[1]]:=1;
        dec(nHeap);
        Down(1);
    End;


Procedure Push (x : LongInt);
    Begin
        inc(nHeap);
        Heap[nHeap]:=x;
        Pos[x]:=nHeap;
        Up(nHeap);
    End;


Procedure Dijkstra (s : LongInt);
 Var tmp: list;
     x: longint;
 Begin
 For i:=1 to N do D[i]:=maxlongint;
 FillChar(Free,SizeOf(Free),true);
 D[s]:=0;
 nHeap:=0;
 push(S);
 Repeat
  u:=pop;
  Free[u]:=false;
  tmp:=a[u];
  While tmp<>nil do
   begin
   v:=tmp^.v;
   if (Free[v]) and (D[u]+tmp^.ts<D[v]) then
    Begin
    D[v]:=D[u]+tmp^.ts; num[v]:=1;
    pre[v,num[v]]:=u;
    if Pos[v]=0 then Push(v) else Up(Pos[v]);
    end
    else if (free[v]) and (d[u]+tmp^.ts=d[v]) then
    begin
    inc(num[v]); pre[v,num[v]]:=u; end;
   tmp:=tmp^.link;
  end;
 Until nheap=0;
 End;

Procedure TRace(x: longint);
 Var y,i: longint;
 Begin
 if x=1 then exit;
 For i:=1 to num[x] do
  begin
  y:=pre[x,i];
  if sl[x,y]>0 then begin ans:=ans+sl[x,y]*c[x,y]; sl[x,y]:=-1; trace(y); end;

  End;
 End;

PRocedure Try;
 Begin
 dijkstra(1);
 Trace(n);
 Assign(F,FO); Rewrite(F); Writeln(f,ans*2); Close(F);
 End;

Begin
  Init;
 TRy;
End.
