Const
    fi='DATPHONG.INP';
    fo='DATPHONG.OUT';
    inf=maxLongInt;
Var
    g,f : Text;
    N,M,i,j,O,vitri,t : LongInt;
    Phong,Cong,Gia,Nguoi,Profit,Leaf : Array[0..500001] of LongInt;
    Fx,Lo,Hi,Pos : Array[0..2000001] of LongInt;
    kq  : Int64;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M,O);
        For i:=1 to N do Readln(f,Cong[i],Phong[i]);
        For i:=1 to M do Readln(f,Gia[i],Nguoi[i]);
        Close(f);
    End;

Procedure Swap (Var abc,xyz : LongInt);
    Var hv : LongInt;
    Begin
        hv:=abc; abc:=xyz; xyz:=hv;
    End;

Procedure QSortA (l,r : LongInt);
    Var i1,j1,x,y,lock : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        lock:=l+Random(r-l+1);
        x:=Phong[lock];
        Repeat
            While (Phong[i1]<x) do inc(i1);
            While (Phong[j1]>x) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(Phong[i1],Phong[j1]);
                    Swap(Cong[i1],Cong[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSortA(l,j1); QSortA(i1,r);
    End;

Procedure QSortB (l,r : LongInt);
    Var i1,j1,x,y,lock : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        lock:=l+Random(r-l+1);
        x:=Gia[lock]; y:=Nguoi[lock];
        Repeat
            While (Gia[i1]>x) or ((Gia[i1]=x) and (Nguoi[i1]<y)) do inc(i1);
            While (Gia[j1]<x) or ((Gia[j1]=x) and (Nguoi[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(Gia[i1],Gia[j1]);
                    Swap(Nguoi[i1],Nguoi[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSortB(l,j1); QSortB(i1,r);
    End;

Function TKNP (gt : LongInt) : LongInt;
    Var l,r,nho,x : LongInt;
    Begin
        l:=1; r:=N; nho:=0;
        Repeat
            x:=(l+r) div 2;
            if Phong[x]>=gt then
                Begin
                    nho:=x;
                    r:=x-1;
                End else l:=x+1;
        Until l>r;
        exit(nho);
    End;

Procedure Build (x,low,high : LongInt);
    Var mid,t1,t2 : LongInt;
    Begin
        Lo[x]:=low; Hi[x]:=high;
        if low=high then
            Begin
                Leaf[low]:=x;
                Fx[x]:=Cong[low];
                Pos[x]:=low;
            End else
            Begin
                mid:=(low+high) div 2;
                Build(x+x,low,mid);
                Build(x+x+1,mid+1,high);
                t1:=Fx[x+x]; if t1=0 then t1:=inf;
                t2:=Fx[x+x+1]; if t2=0 then t2:=inf;
                if t1<t2 then
                    Begin
                        Fx[x]:=Fx[x+x];
                        Pos[x]:=Pos[x+x];
                        exit;
                    End;
                Fx[x]:=Fx[x+x+1];
                Pos[x]:=Pos[x+x+1];
            End;
    End;

Procedure Update (vt,gt : LongInt);
    Var x,t1,t2 : LongInt;
    Begin
        x:=Leaf[vt];
        Fx[x]:=gt;
        While x>1 do
            Begin
                x:=x div 2;
                t1:=Fx[x+x]; if t1=0 then t1:=inf;
                t2:=Fx[x+x+1]; if t2=0 then t2:=inf;
                if t1<t2 then
                    Begin
                        Fx[x]:=Fx[x+x];
                        Pos[x]:=Pos[x+x];
                    End else
                    Begin
                        Fx[x]:=Fx[x+x+1];
                        Pos[x]:=Pos[x+x+1];
                    End;
            End;
    End;

Function Query (l,r : LongInt) : LongInt;
    Function Get (x : LongInt) : LongInt;
        Var t1,t2 : LongInt;
        Begin
            if (Lo[x]>r) or (Hi[x]<l) then exit(0);
            if (Lo[x]>=l) and (Hi[x]<=r) then exit(Pos[x]);
            t1:=Get(x+x);
            t2:=Get(x+x+1);
            if t1=0 then exit(t2) else
                if t2=0 then exit(t1) else
            if Cong[t1]<Cong[t2] then exit(t1) else exit(t2);
        End;
    Begin
        exit(Get(1));
    End;


Procedure XuLy;
    Begin
        Randomize;
        QSortA(1,N);
        QSortB(1,M);
        Build(1,1,N);
        For M:=1 to M do
            Begin
                vitri:=TKNP(Nguoi[M]);
                if vitri=0 then continue;
                t:=Query(vitri,N);
                if Gia[M]<Cong[t] then continue;
                Profit[t]:=Gia[M]-Cong[t];
                Cong[t]:=inf;
                Update(t,inf);
            End;
    End;

Procedure QSort (l,r : LongInt);
    Var i1,j1,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r;
        x:=Profit[l+Random(r-l+1)];
        Repeat
            While Profit[i1]>x do inc(i1);
            While Profit[j1]<x do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(Profit[i1],Profit[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1); QSort(i1,r);
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        QSort(1,N);
        kq:=0;
        For i:=1 to O do
            kq:=kq+int64(Profit[i]);
        Write(g,kq);
        Close(g);
    End;


Begin
    DocFile;
    XuLy;
    GhiFile;
End.




