Uses math;
Const
    fi='QUEENS.INP';
    fo='QUEENS.OUT';
Var
    g,f : Text;
    K,N,i,j,left,right : LongInt;
    QI,QJ,VT : Array[0..100001] of LongInt;
    Ans : Array[0..100001] of LongInt;

Procedure Swap (Var x,y : LongInt);
    Var tmp : LongInt;
    Begin
        tmp:=x; x:=y; y:=tmp;
    End;


Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,K,N);
        For i:=1 to N do
            Begin
                Readln(f,QI[i],QJ[i]);
                VT[i]:=i;
            End;
        Close(f);
    End;

Procedure QSort1 (l,r : LongInt);
    Var i1,j1,lock,y,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r; lock:=l+Random(r-l+1);
        x:=QI[lock]; y:=QJ[lock];
        Repeat
            While (QI[i1]<x) or ((QI[i1]=x) and (QJ[i1]<y)) do inc(i1);
            While (QI[j1]>x) or ((QI[j1]=x) and (QJ[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(QI[i1],QI[j1]);
                    Swap(QJ[i1],QJ[j1]);
                    Swap(VT[i1],VT[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort1(l,j1); QSort1(i1,r);
    End;

Procedure QSort2 (l,r : LongInt);
    Var i1,j1,lock,y,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r; lock:=l+Random(r-l+1);
        x:=QJ[lock]; y:=QI[lock];
        Repeat
            While (QJ[i1]<x) or ((QJ[i1]=x) and (QI[i1]<y)) do inc(i1);
            While (QJ[j1]>x) or ((QJ[j1]=x) and (QI[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(QI[i1],QI[j1]);
                    Swap(QJ[i1],QJ[j1]);
                    Swap(VT[i1],VT[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort2(l,j1); QSort2(i1,r);
    End;

Procedure QSort3 (l,r : LongInt);
    Var i1,j1,lock,y,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r; lock:=l+Random(r-l+1);
        x:=QI[lock]-QJ[lock]; y:=QI[lock];
        Repeat
            While (QI[i1]-QJ[i1]<x) or ((QI[i1]-QJ[i1]=x) and (QI[i1]<y)) do inc(i1);
            While (QI[j1]-QJ[j1]>x) or ((QI[j1]-QJ[j1]=x) and (QI[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(QI[i1],QI[j1]);
                    Swap(QJ[i1],QJ[j1]);
                    Swap(VT[i1],VT[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort3(l,j1); QSort3(i1,r);
    End;

Procedure QSort4 (l,r : LongInt);
    Var i1,j1,lock,y,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r; lock:=l+Random(r-l+1);
        x:=QI[lock]+QJ[lock]; y:=QI[lock];
        Repeat
            While (QI[i1]+QJ[i1]<x) or ((QI[i1]+QJ[i1]=x) and (QI[i1]<y)) do inc(i1);
            While (QI[j1]+QJ[j1]>x) or ((QI[j1]+QJ[j1]=x) and (QI[j1]>y)) do dec(j1);
            if i1<=j1 then
                Begin
                    Swap(QI[i1],QI[j1]);
                    Swap(QJ[i1],QJ[j1]);
                    Swap(VT[i1],VT[j1]);
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort4(l,j1); QSort4(i1,r);
    End;

Procedure XuLy;
    Begin
        Randomize;
        QSort1(1,N);
        For i:=1 to N do
            Begin
                if QI[i-1]=QI[i] then left:=QJ[i-1] else left:=0;
                if QI[i+1]=QI[i] then right:=QJ[i+1] else right:=K+1;
                Ans[vt[i]]:=ans[vt[i]]+int64(right)-int64(left)-2;
            End;
        QSort2(1,N);
        For i:=1 to N do
            Begin
                if QJ[i-1]=QJ[i] then left:=QI[i-1] else left:=0;
                if QJ[i+1]=QJ[i] then right:=QI[i+1] else right:=K+1;
                ans[vt[i]]:=ans[vt[i]]+int64(right)-int64(left)-2;
            End;
        QSort3(1,N);
        For i:=1 to N do
            Begin
                if QI[i-1]-QJ[i-1]=QI[i]-QJ[i] then left:=QI[i-1] else left:=QI[i]-min(QI[i],QJ[i]);
                if QI[i+1]-QJ[i+1]=QI[i]-QJ[i] then right:=QI[i+1] else right:=QI[i]+min(K-QI[i],K-QJ[i])+1;
                ans[vt[i]]:=ans[vt[i]]+int64(right)-int64(left)-2;
            End;
        QSort4(1,N);
        For i:=1 to N do
            Begin
                if QI[i-1]+QJ[i-1]=QI[i]+QJ[i] then left:=QI[i-1] else left:=QI[i]-min(QI[i],K-QJ[i]+1);
                if QI[i+1]+QJ[i+1]=QI[i]+QJ[i] then right:=QI[i+1] else right:=QI[i]+min(K-QI[i]+1,QJ[i]);
                ans[vt[i]]:=ans[vt[i]]+int64(right)-int64(left)-2;
            End;
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        For i:=1 to N do Writeln(g,Ans[i]);
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.



