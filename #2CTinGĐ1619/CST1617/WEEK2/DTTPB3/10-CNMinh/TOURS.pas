Uses math;
Const
    fi='TOURS.INP';
    fo='TOURS.OUT';
    inf=1000000000;
Var
    g,f : Text;
    test,N,M,i,j,u,v,nott,nHeap,swap : LongInt;
    A,DSK : Array[0..1001,0..1001] of LongInt;
    soluong,D,Heap,Pos : Array[0..1001] of LongInt;
    CoDinh : Array[0..1001] of Boolean;
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
    Begin
        For i:=1 to N do D[i]:=inf;
        FillChar(CoDinh,SizeOf(CoDinh),false);
        FillChar(Pos,SizeOf(Pos),0);
        D[s]:=0;
        nHeap:=0;
        Push(s);
        dk:=true;
        Repeat
            u:=Pop;
            CoDinh[u]:=true;
            For i:=1 to soluong[u] do
                Begin
                    v:=DSK[u,i];
                    if (not CoDinh[v]) and (D[u]+A[u,v]<D[v]) then
                        Begin
                            D[v]:=D[u]+A[u,v];
                            if (Pos[v]=0) then Push(v) else UpHeap(Pos[v]);
                        End;
                End;
            if (u=s) and dk then
                Begin
                    dk:=false;
                    D[s]:=inf;
                    CoDinh[s]:=false;
                End;
        Until nHeap=0;
        if A[s,s]>0 then D[s]:=min(D[s],A[s,s]);
        if D[s]=inf then D[s]:=-1;
        exit(D[s]);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,N,M);
            FillChar(soluong,SizeOf(soluong),0);
            FillChar(A,SizeOf(A),0);
            For i:=1 to M do
                Begin
                    Readln(f,u,v,j);
                    if A[u,v]=0 then
                        Begin
                            inc(soluong[u]);
                            DSK[u,soluong[u]]:=v;
                            A[u,v]:=j;
                            continue;
                        End;
                    A[u,v]:=min(A[u,v],j);
                End;
            For nott:=1 to N do Writeln(g,Dijkstra(nott));
        End;
    Close(f);
    Close(g);
End.
