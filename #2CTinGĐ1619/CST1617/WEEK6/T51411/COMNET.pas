Uses math;
Const
    fi='COMNET.INP';
    fo='COMNET.OUT';
    inf=1000000000;
Type List=^node;
    node=record
    u,v,c: longint; Link:list; end;

Var
    g,f : Text;
    test,N,M,i,j,u,v,nott,nHeap,swap : LongInt;
    Tmp:list;
    A: Array [0..300002] of List;
    D,Heap,Pos,X : Array[0..300002] of LongInt;
    CoDinh : Array[0..300002] of Boolean;
    dk   : Boolean;

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
 Var C: longint;
    Begin
        For i:=1 to N do D[i]:=inf;
        FillChar(CoDinh,SizeOf(CoDinh),false);
        FillChar(Pos,SizeOf(Pos),0);
        Fillchar(X,Sizeof(X),0);
        D[s]:=0;
        nHeap:=0;
        Push(s);
        dk:=true;
        Repeat
            u:=Pop;
            Tmp:=a[u];
            CoDinh[u]:=true;
            While tmp<>nil do begin
             v:=tmp^.v;
             c:=tmp^.c;
             if (not CoDinh[v]) and (D[u]+c<D[v]) then
              Begin
              D[v]:=D[u]+c;
              X[v]:=Max(x[u],Max(x[v],C));
              if (Pos[v]=0) then Push(v) else UpHeap(Pos[v]);
             End;
             Tmp:=tmp^.link;
             End;
        Until nHeap=0;
        exit(X[n]);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,N,M);
    For i:=1 to n do A[i]:=nil;
    For i:=1 to M do
     Begin
     Readln(f,u,v);
     New(tmp);
     Tmp^.v:=v; Tmp^.c:=i; tmp^.link:=a[u]; a[u]:=tmp;
     End;
    Writeln(g,Dijkstra(1));
    Close(f);
    Close(g);
End.
