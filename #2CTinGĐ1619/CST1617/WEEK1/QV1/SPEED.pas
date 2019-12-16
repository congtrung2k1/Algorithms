//CNMinh - 12CTIN -LHP
Const
    fi='SPEED.INP';
    fo='SPEED.OUT';
    inf=1000000000;
Type
    Heap_data=record
        gt : Real; vt,speed : LongInt; End;
Var
    g,f : Text;
    N,M,finish,i,j,u,v,tmp,u1,v1,nHeap,nGhi : LongInt;
    Ghi : Array[0..10000] of LongInt;
    DSK,L,Sp : Array[0..151,0..151] of LongInt;
    P   : Array[0..151,0..501] of Real;
    Pos : Array[0..151,0..501] of LongInt;
    Trace : Array[0..151,0..501,1..2] of LongInt;
    CoDinh: Array[0..151,0..501] of Boolean;
    soluong : Array[0..151] of LongInt;
    Heap : Array[0..100001] of Heap_data;
    swap : Heap_data;
    mini : real;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M,finish);
        inc(finish);
        For i:=1 to M do
            Begin
                Readln(f,u,v,Sp[u+1,v+1],L[u+1,v+1]);
                inc(u);
                inc(v);
                inc(soluong[u]);
                DSK[u,soluong[u]]:=v;
            End;
        Close(f);
    End;

Procedure UpHeap (x : LongInt);
    Begin
        if x<=1 then exit;
        if (Heap[x].gt>Heap[x div 2].gt) then exit;
        swap:=Heap[x];
        Heap[x]:=Heap[x div 2];
        Heap[x div 2]:=swap;
        Pos[Heap[x].vt,Heap[x].speed]:=x;
        Pos[Heap[x div 2].vt,Heap[x div 2].speed]:=x div 2;
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
                Pos[Heap[x].vt,Heap[x].speed]:=x;
                Pos[Heap[y].vt,Heap[y].speed]:=y;
                DownHeap(y);
            End;
    End;


Procedure Push (x,y : longInt);
    Begin
        inc(nHeap);
        Heap[nHeap].vt:=x;
        Heap[nHeap].speed:=y;
        Heap[nHeap].gt:=P[x,y];
        Pos[x,y]:=nHeap;
        UpHeap(nHeap);
    End;

Procedure Pop;
    Begin
        u:=Heap[1].vt;
        v:=Heap[1].speed;
        Heap[1]:=Heap[nHeap];
        dec(nHeap);
        Pos[Heap[1].vt,Heap[1].speed]:=1;
        DownHeap(1);
    End;

Procedure XuLy;
    Begin
        For i:=1 to N do
            For j:=1 to 500 do P[i,j]:=inf;
        nHeap:=0;
        FillChar(CoDinh,SizeOf(CoDinh),false);
        FillChar(Pos,SizeOf(Pos),0);
        P[1,70]:=0;
        Trace[1,70,1]:=0;
        Trace[1,70,2]:=0;
        Push(1,70);
        Repeat
            Pop;
            CoDinh[u,v]:=true;
            For i:=1 to soluong[u] do
                Begin
                    u1:=DSK[u,i];
                    if Sp[u,u1]=0 then tmp:=v else tmp:=Sp[u,u1];
                    if (P[u,v]+(L[u,u1]/tmp)<P[u1,tmp]) and (not CoDinh[u1,tmp]) then
                        Begin
                            P[u1,tmp]:=P[u,v]+(L[u,u1]/tmp);
                            Trace[u1,tmp,1]:=u;
                            Trace[u1,tmp,2]:=v;
                            if Pos[u1,tmp]=0 then Push(u1,tmp) else UpHeap(Pos[u1,tmp]);
                        End;
                End;
        Until nHeap=0;
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        mini:=inf;
        For i:=1 to 500 do
            if (P[finish,i]<mini) then
                Begin
                    mini:=P[finish,i];
                    u:=finish;
                    v:=i;
                End;
        nGhi:=0;
        Repeat
            inc(nGhi);
            Ghi[nGhi]:=u-1;
            u1:=Trace[u,v,1];
            v1:=Trace[u,v,2];
            u:=u1; v:=v1;
        Until u=0;
        //Writeln(g,mini:0:3);
        For i:=nGhi downto 1 do Write(g,Ghi[i],' ');
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.



