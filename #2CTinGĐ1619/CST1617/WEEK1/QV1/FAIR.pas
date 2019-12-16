//CAO NGUYET MINH -12CTIN -LHP
Const
    fi='FAIR.INP';
    fo='FAIR.OUT';
    inf=1000000000;
Type
    Heap_data=record
        ii,jj,gt : LongInt; End;
Var
    g,f : Text;
    A,P,Pos   : Array[0..501,0..501] of LongInt;
    CoDinh : Array[0..501,0..501] of Boolean;
    Heap : Array[0..500001] of Heap_data;
    N,M,i,j,u,v,nHeap : LongInt;
    swap : Heap_data;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        For i:=1 to N do
            For j:=1 to M do Read(f,A[i,j]);
        Close(f);
    End;

Procedure UpHeap (x : LongInt);
    Begin
        if x<=1 then exit;
        if Heap[x].gt>Heap[x div 2].gt then exit;
        swap:=Heap[x];
        Heap[x]:=Heap[x div 2];
        Heap[x div 2]:=swap;
        Pos[Heap[x].ii,Heap[x].jj]:=x;
        Pos[Heap[x div 2].ii,Heap[x div 2].jj]:=x div 2;
        UpHeap(x div 2);
    End;

Procedure DownHeap (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if y>nHeap then exit;
        if (y<nHeap) and (Heap[y].gt>Heap[y+1].gt) then inc(y);
        if Heap[x].gt>Heap[y].gt then
            Begin
                swap:=Heap[x];
                Heap[x]:=Heap[y];
                Heap[y]:=swap;
                Pos[Heap[x].ii,Heap[x].jj]:=x;
                Pos[Heap[y].ii,Heap[y].jj]:=y;
                DownHeap(y);
            End;
    End;

Procedure Push (x,y : LongInt);
    Begin
        inc(nHeap);
        Heap[nHeap].ii:=x;
        Heap[nHeap].jj:=y;
        Heap[nHeap].gt:=P[x,y];
        Pos[x,y]:=nHeap;
        UpHeap(nHeap);
    End;

Procedure Pop;
    Begin
        u:=Heap[1].ii;
        v:=Heap[1].jj;
        Heap[1]:=Heap[nHeap];
        dec(nHeap);
        Pos[Heap[1].ii,Heap[1].jj]:=1;
        DownHeap(1);
    End;

Procedure Update (x,y : LongInt);
    Begin
        if (x<1) or (y<1) or (x>N) or (y>M) then exit;
        if CoDinh[x,y] then exit;
        if P[u,v]+A[x,y]<P[x,y] then
            Begin
                P[x,y]:=P[u,v]+A[x,y];
                if Pos[x,y]=0 then Push(x,y) else UpHeap(Pos[x,y]);
            End;
    End;

Procedure XuLy;
    Begin
        For i:=1 to N do
            For j:=1 to M do P[i,j]:=inf;
        P[0,0]:=0;
        FillChar(CoDinh,SizeOf(CoDinh),false);
        nHeap:=0;
        Push(0,0);
        Repeat
            Pop;
            CoDinh[u,v]:=true;
            if (u=0) and (v=0) then
                For i:=1 to N do Update(i,1) else
                    Begin
                        Update(u,v+1);
                        Update(u+1,v);
                        Update(u,v-1);
                        Update(u-1,v);
                    End;
        Until nHeap=0;
    End;

Procedure GhiFile;
    Var kq : LongInt;
    Begin
        Assign(g,fo);
        Rewrite(g);
        kq:=inf;
        For i:=1 to N do
            if P[i,M]<kq then kq:=P[i,M];
        Write(g,kq);
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.
