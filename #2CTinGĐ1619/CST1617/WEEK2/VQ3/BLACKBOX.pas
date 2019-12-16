Const
    fi='BLACKBOX.INP';
    fo='BLACKBOX.OUT';
Var
    g,f : Text;
    A,Heap1,Heap2,Query : Array[0..30001] of LongInt;
    nHeap1,nHeap2,lim,N,M,i,j,cur,tmp,swap : LongInt;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        For i:=1 to N do Read(f,A[i]); Readln(f);
        For i:=1 to M do Read(f,Query[i]);
        Close(f);
    End;

Procedure Up1 (x : LongInt);
    Begin
        if x<=1 then exit;
        if Heap1[x]<Heap1[x div 2] then exit;
        swap:=Heap1[x];
        Heap1[x]:=Heap1[x div 2];
        Heap1[x div 2]:=swap;
        Up1(x div 2);
    End;

Procedure Up2 (x : LongInt);
    Begin
        if x<=1 then exit;
        if Heap2[x]>Heap2[x div 2] then exit;
        swap:=Heap2[x];
        Heap2[x]:=Heap2[x div 2];
        Heap2[x div 2]:=swap;
        Up2(x div 2);
    End;

Procedure Down1 (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if y>nHeap1 then exit;
        if (y<nHeap1) and (Heap1[y]<Heap1[y+1]) then inc(y);
        if Heap1[x]<Heap1[y] then
            Begin
                swap:=Heap1[x];
                Heap1[x]:=Heap1[y];
                Heap1[y]:=swap;
                Down1(y);
            End;
    End;

Procedure Down2 (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if y>nHeap2 then exit;
        if (y<nHeap2) and (Heap2[y]>Heap2[y+1]) then inc(y);
        if Heap2[x]>Heap2[y] then
            Begin
                swap:=Heap2[x];
                Heap2[x]:=Heap2[y];
                Heap2[y]:=swap;
                Down2(y);
            End;
    End;

Procedure Push1 (x : LongInt);
    Begin
        inc(nHeap1);
        Heap1[nHeap1]:=x;
        Up1(nHeap1);
    End;

Procedure Push2 (x : LongInt);
    Begin
        inc(nHeap2);
        Heap2[nHeap2]:=x;
        Up2(nHeap2);
    End;

Function Pop2 : LongInt;
    Begin
        Pop2:=Heap2[1];
        Heap2[1]:=Heap2[nHeap2];
        dec(nHeap2);
        Down2(1);
    End;

Procedure XuLy;
    Begin
        Assign(g,fo);
        Rewrite(g);
        nHeap1:=0;
        nHeap2:=0;
        lim:=1;
        cur:=1;
        For i:=1 to M do
            Begin
            For j:=cur to Query[i] do
                Begin
                    if nHeap1<lim then Push1(A[j]) else
                        if A[j]>=Heap1[1] then Push2(A[j]) else
                            Begin
                                tmp:=Heap1[1];
                                Push2(tmp);
                                Heap1[1]:=A[j];
                                Down1(1);
                            End;
                End;
                    Writeln(g,Heap1[1]);
                    inc(lim);
                    if nHeap2>0 then
                        Begin
                            tmp:=Pop2;
                            Push1(tmp);
                        End;
                    cur:=Query[i]+1;
            End;
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
End.


