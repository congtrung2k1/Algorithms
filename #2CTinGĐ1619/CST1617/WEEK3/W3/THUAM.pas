Const
    fi='THUAM.INP';
    fo='THUAM.OUT';
Type
    Heap_data=record
        gt,vt : LongInt;
            End;
Var
    g,f : Text;
    N,i,j,m,dif,nMin,nMax,Ans : LongInt;
    A,PosMin,PosMax  : Array[0..1000001] of LongInt;
    HeapMax,HeapMin  : Array[0..1000001] of Heap_data;
    swap : Heap_data;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M,dif);
        For i:=1 to N do Read(f,A[i]);
        Close(f);
    End;

Procedure UpMin (x : LongInt);
    Begin
        if x<=1 then exit;
        if HeapMin[x].gt>HeapMin[x div 2].gt then exit;
        swap:=HeapMin[x];
        HeapMin[x]:=HeapMin[x div 2];
        HeapMin[x div 2]:=swap;
        PosMin[HeapMin[x].vt]:=x;
        PosMin[HeapMin[x div 2].vt]:=x div 2;
        UpMin(x div 2);
    End;

Procedure UpMax (x : LongInt);
    Begin
        if x<=1 then exit;
        if HeapMax[x].gt<HeapMax[x div 2].gt then exit;
        swap:=HeapMax[x];
        HeapMax[x]:=HeapMax[x div 2];
        HeapMax[x div 2]:=swap;
        PosMax[HeapMax[x].vt]:=x;
        PosMax[HeapMax[x div 2].vt]:=x div 2;
        UpMax(x div 2);
    End;

Procedure DownMin (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if (y>nMin) then exit;
        if (y<nMin) and (HeapMin[y].gt>HeapMin[y+1].gt) then inc(y);
        if HeapMin[x].gt>HeapMin[y].gt then
            Begin
                swap:=HeapMin[x]; HeapMin[x]:=HeapMin[y]; HeapMin[y]:=swap;
                PosMin[HeapMin[x].vt]:=x;
                PosMin[HeapMin[y].vt]:=y;
                DownMin(y);
            End;
    End;

Procedure DownMax (x : LongInt);
    Var y : LongInt;
    Begin
        y:=x+x;
        if (y>nMax) then exit;
        if (y<nMax) and (HeapMax[y].gt<HeapMax[y+1].gt) then inc(y);
        if (HeapMax[x].gt<HeapMax[y].gt) then
            Begin
                swap:=HeapMax[x];
                HeapMax[x]:=HeapMax[y];
                HeapMax[y]:=swap;
                PosMax[HeapMax[x].vt]:=x;
                PosMax[HeapMax[y].vt]:=y;
                DownMax(y);
            End;
    End;


Procedure PushMax (val,p : LongInt);
    Begin
        inc(nMax);
        HeapMax[nMax].gt:=val;
        HeapMax[nMax].vt:=p;
        PosMax[p]:=nMax;
        UpMax(nMax);
    End;

Procedure PushMin (val,p : LongInt);
    Begin
        inc(nMin);
        HeapMin[nMin].gt:=val;
        HeapMin[nMin].vt:=p;
        PosMin[p]:=nMin;
        UpMin(nMin);
    End;

Procedure PopMin (p : LongInt);
    Begin
        if p=0 then exit;
        HeapMin[p]:=HeapMin[nMin];
        PosMin[HeapMin[p].vt]:=p;
        dec(nMin);
        if p>nMin then exit;
        UpMin(p);
        DownMin(p);
    End;

Procedure PopMax (p : LongInt);
    Begin
        if p=0 then exit;
        HeapMax[p]:=HeapMax[nMax];
        PosMax[HeapMax[p].vt]:=p;
        dec(nMax);
        if p>nMax then exit;
        UpMax(p);
        DownMax(p);
    End;

Procedure Try;
    Begin
        Assign(g,fo); Rewrite(g);
        nMin:=0;
        nMax:=0;
        ans:=0;
        For i:=1 to M-1 do
            Begin
                PushMin(A[i],i);
                PushMax(A[i],i);
            End;
        For i:=M to N do
            Begin
                PopMin(PosMin[i-M]);
                PopMax(PosMax[i-M]);
                PushMin(A[i],i);
                PushMax(A[i],i);
                if (HeapMax[1].gt-HeapMin[1].gt)<=dif then
                    Begin
                        Writeln(g,i-M+1);
                        inc(ans);
                    End;
            End;
        if ans =0 then writeln(g,0);
        Close(g);
    End;

Begin
 Init;
 Try;
End.
