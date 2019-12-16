Uses math;
Const
    fi='DIAMOND.INP';
    fo='DIAMOND.OUT';
Var
    g,f : Text;
    N,a,b,dem,i,j,u,v,nHeap,swap,time : LongInt;
    T,GT,Heap : Array[0..100001] of LongInt;
    kq : Int64;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Read(f,N,a,b);
        dec(b);
        dem:=0;
        For i:=1 to N do
            Begin
                Read(f,u,v);
                if (u<a) or (u>b) then continue;
                inc(dem);
                T[dem]:=u;
                GT[dem]:=v;
            End;
        N:=dem;
        Close(f);
    End;

Procedure QSort (l,r : LongInt);
    Var i1,j1,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        x:=T[l+Random(r-l+1)];
        Repeat
            While T[i1]<x do inc(i1);
            While T[j1]>x do dec(j1);
            if i1<=j1 then
                Begin
                    i:=T[i1]; T[i1]:=T[j1]; T[j1]:=i;
                    i:=GT[i1]; GT[i1]:=GT[j1]; GT[j1]:=i;
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1); QSort(i1,r);
    End;

Procedure UpHeap (x : LongInt);
    Begin
        if x=1 then exit;
        if Heap[x]<Heap[x div 2] then exit;
        swap:=Heap[x]; Heap[x]:=Heap[x div 2]; Heap[x div 2]:=swap;
        UpHeap(x div 2);
    End;

Procedure DownHeap (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if y>nHeap then exit;
        if (y<nHeap) and (Heap[y]<Heap[y+1]) then inc(y);
        if Heap[x]<Heap[y] then
            Begin
                swap:=Heap[x]; Heap[x]:=Heap[y]; Heap[y]:=swap;
                DownHeap(y);
            End;
    End;

Procedure Push (aa : LongInt);
    Begin
        inc(nHeap);
        Heap[nHeap]:=aa;
        UpHeap(nHeap);
    End;

Function Pop : LongInt;
    Begin
        Pop:=Heap[1];
        Heap[1]:=Heap[nHeap];
        dec(nHeap);
        DownHeap(1);
    End;

Procedure Try;
    Begin
        Randomize;
        QSort(1,N);
        i:=1;
        nHeap:=0;
        kq:=0;
        T[N+1]:=b+1;
        Repeat
            time:=T[i];
            While time=T[i] do
                Begin
                    Push(GT[i]);
                    inc(i);
                End;
            time:=T[i]-time;
            time:=min(nHeap,time);
            For j:=1 to time do
                Begin
                    u:=Pop;
                    kq:=int64(kq+int64(u));
                End;
        Until i>N;
    End;

Procedure outp;
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
