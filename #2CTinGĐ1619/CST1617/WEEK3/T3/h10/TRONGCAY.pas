Const
    fi='TRONGCAY.INP';
    fo='TRONGCAY.OUT';
    inf=1000000000;
Type
    DSC_data=record
        ii,jj,linki,linkj,gt : LongInt;
            End;
Var
    g,f : Text;
    N,i,j,u,v,M,nHeap,swap,vt,kq : LongInt;
    DSC : Array[0..300001] of DSC_data;
    Head,D,Heap,Pos,P1,PN : Array[0..100001] of LongInt;
    Free : Array[0..100001] of Boolean;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        For i:=1 to M do
            Begin
                Readln(f,u,v,DSC[i].gt);
                inc(u); inc(v);
                DSC[i].linki:=Head[u];
                DSC[i].linkj:=Head[v];
                DSC[i].ii:=u;
                DSC[i].jj:=v;
                Head[u]:=i;
                Head[v]:=i;
            End;
        Close(f);
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
    Begin
        For i:=1 to N do D[i]:=inf;
        FillChar(Free,SizeOf(Free),true);
        FillChar(Pos,SizeOf(Pos),0);
        D[s]:=0;
        nHeap:=0;
        Push(s);
        Repeat
            u:=Pop;
            Free[u]:=false;
            vt:=Head[u];
            Repeat
                if vt=0 then break;
                if u=DSC[vt].ii then v:=DSC[vt].jj else v:=DSC[vt].ii;
                if (Free[v]) and (D[u]+DSC[vt].gt<D[v]) then
                    Begin
                        D[v]:=D[u]+DSC[vt].gt;
                        if Pos[v]=0 then Push(v) else Up(Pos[v]);
                    End;
                if u=DSC[vt].ii then vt:=DSC[vt].linki else vt:=DSC[vt].linkj;
            Until false;
        Until nHeap=0;
    End;

Procedure Try;
    Begin
        Dijkstra(1);
        P1:=D;
        Dijkstra(N);
        PN:=D;
        kq:=0;
        For i:=1 to M do
            Begin
                u:=DSC[i].ii;
                v:=DSC[i].jj;
                if P1[u]+PN[v]+DSC[i].gt=P1[N] then
                    Begin
                        inc(kq,DSC[i].gt*2);
                        continue;
                    End;
                if P1[v]+PN[u]+DSC[i].gt=P1[N] then
                    inc(kq,DSC[i].gt*2);
            End;
    End;

Procedure Outp;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
    Init;
    Try;
    Outp;
End.


