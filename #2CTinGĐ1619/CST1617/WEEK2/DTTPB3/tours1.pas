CONST FI='TOURS.INP';
      FO='TOURS.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V,C: LONGINT; LINK: LIST; END;

VAR A: ARRAY [1..1000] Of list;
    D,HEAP,POS: ARRAY [1..100000] OF LONGINT;
    CODINH: ARRAY [1..100000] OF BOOLEAN;
    NHEAP,TEST,N,M,I,SWAP: LONGINT;
    F,G: TEXT;

Procedure UpHeap (x : LongInt);
    Begin
        if x<=1 then exit;
        if D[Heap[x]]>D[Heap[x div 2]] then exit;
        swap:=Heap[x]; Heap[x]:=Heap[x div 2]; Heap[x div 2]:=swap;
        Pos[Heap[x]]:=x;
        Pos[Heap[x div 2]]:=x div 2;
        UpHeap(x div 2);
    End;

Procedure DownHeap (x : LongInt);
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
                DownHeap(y);
            End;
    End;

Procedure Push (x : LongInt);
    Begin
        inc(nHeap);
        Heap[nHeap]:=x;
        Pos[x]:=nHeap;
        UpHeap(nHeap);
    End;

Function Pop : LongInt;
    Begin
        Pop:=Heap[1];
        Heap[1]:=Heap[nHeap];
        dec(nHeap);
        Pos[Heap[1]]:=1;
        DownHeap(1);
    End;



Function Dijkstra (s : LongInt) : LongInt;
 Var dk: boolean;
     tmp: list;
     u,v,c: longint;
 Begin
 For i:=1 to N do D[i]:=maxlongint;
 FillChar(CoDinh,SizeOf(CoDinh),false);
 FillChar(Pos,SizeOf(Pos),0);
 D[s]:=0;
 nHeap:=0;
 Push(s);
 dk:=true;
 Repeat
  u:=Pop;
  CoDinh[u]:=true;
  tmp:=a[u];
  While tmp<>nil do begin
   v:=tmp^.v; c:=tmp^.c;
   if (not CoDinh[v]) and (D[u]+c<D[v]) then
   Begin
   D[v]:=D[u]+c;
   if (Pos[v]=0) then Push(v) else UpHeap(Pos[v]);
   End;
   tmp:=tmp^.link;
   End;
  if (u=s) and dk then Begin
                    dk:=false;
                    D[s]:=maxlongint;
                    CoDinh[s]:=false;
                End;
  Until nHeap=0;
//  if A[s,s]>0 then D[s]:=min(D[s],A[s,s]);
  if D[s]=maxlongint then D[s]:=-1;
  exit(D[s]);
 End;

Procedure Try;
 Begin
 For u:=1 to n do dji(u);
 End;

Procedure Init;
 BEgin
 Assign(f,FI); Reset(f);
 Assign(g,FO); REwrite(g);
 Readln(F,test);
 For test:=1 to test do
  begin
   readln(F,n,m);
   For n:=1 to n do a[n]:=nil;
   For m:=1 to m do begin
    readln(f,u,v,c);
    new(tmp);
    tmp^.v:=v; tmp^.link:=a[u]; a[u]:=tmp;
    end;
   Try;
  End;
 Close(f); Close(G);
 End;