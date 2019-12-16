//Pham Minh Duc 1316
Program KINGPATH;
Const
    fi='KING.INP';
    fo='KING.OUT';
Type
    data=record
        ii,jj : LongInt; mark : Boolean; End;
Var
    g,f : Text;
    AI,AJ,QI,QJ,D : Array[0..2000001] of LongInt;
    A   : Array[0..200001] of data;
    N,M,i,j,startx,starty,endx,endy,front,rear,kq,u,v : LongInt;

Procedure Swap (Var amazing,me : LongInt);
    Var swapper : LongInt;
    Begin
        swapper:=amazing; amazing:=me; me:=swapper;
    End;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,startx,starty,endx,endy);
        Readln(f,M);
        N:=0;
        For i:=1 to M do
            Begin
                Readln(f,j,u,v);
                For u:=u to v do
                    Begin
                        inc(N);
                        AI[N]:=j;
                        AJ[N]:=u;
                    End;
            End;
        Close(f);
    End;

Procedure QSort (l,r : LongInt);
    Var i1,j1,x,y,lock : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        lock:=l+Random(r-l+1);
        x:=AI[lock];
        y:=AJ[lock];
        Repeat
            While (AI[i1]<x) or ((AI[i1]=x) and (AJ[i1]<y)) do inc(i1);
            While (AI[j1]>x) or ((AI[j1]=x) and (AJ[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(AI[i1],AI[j1]);
                    Swap(AJ[i1],AJ[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1); QSort(i1,r);
    End;

Procedure Init;
    Var ti,dem : LongInt;
    Begin
        Randomize;
        QSort(1,N);
        ti:=0;
        AI[0]:=0; AJ[0]:=0;
        AI[N+1]:=N+1; AJ[N+1]:=N+1;
        dem:=0;
        For i:=1 to N do
            if (AI[i]<>AI[ti]) or (AJ[i]<>AJ[ti]) then
                    Begin
                        inc(dem);
                        ti:=i;
                        A[dem].ii:=AI[i];
                        A[dem].jj:=AJ[i];
                        A[dem].mark:=true;
                    End;
        N:=dem;
    End;

Function TKNP (x,y : LongInt) : Boolean;
    Var l,mid,r : LongInt;
    Begin
        l:=1; r:=N;
        Repeat
            mid:=(l+r) div 2;
            if (A[mid].ii=x) and (A[mid].jj=y) then
                if A[mid].mark then
                    Begin
                        A[mid].mark:=false;
                        exit(true);
                    End else exit(false);
            if (A[mid].ii<x) or ((A[mid].ii=x) and (A[mid].jj<y))
                then l:=mid+1 else r:=mid-1;
        Until l>r;
        exit(false);
    End;


Procedure Update (x,y : LongInt);
    Var dk : Boolean;
    Begin
        dk:=TKNP(x,y);
        if not dk then exit;
        inc(rear);
        QI[rear]:=x;
        QJ[rear]:=y;
        D[rear]:=D[front]+1;
    End;

Procedure XuLy;
    Begin
        Init;
        front:=1; rear:=1;
        TKNP(startx,starty);
        QI[1]:=startx;
        QJ[1]:=starty;
        D[1]:=0;
        kq:=-1;
        Repeat
            u:=QI[front];
            v:=QJ[front];
            if (u=endx) and (v=endy) then
                Begin
                    kq:=D[front];
                    exit;
                End;
            Update(u-1,v-1);
            Update(u-1,v);
            Update(u-1,v+1);
            Update(u,v-1);
            Update(u,v+1);
            Update(u+1,v-1);
            Update(u+1,v);
            Update(u+1,v+1);
            inc(front);
        Until front>rear;
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.


