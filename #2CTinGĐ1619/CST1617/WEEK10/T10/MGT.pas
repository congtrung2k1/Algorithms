Uses math;
Const
    fi='MGT.INP';
    fo='MGT.OUT';
Var
    g,f : Text;
    IsA,IsB : Array[0..100001] of Boolean;
    ChildA,ChildB,DemA,DemB,TPLT,P,Num,Low : Array[0..100001] of LongInt;
    Head,LinkI,LinkJ,II,JJ : Array[0..1000001] of LongInt;
    DK : Array[0..1000001] of Boolean;
    N,M,nA,nB,i,j,u,v,stplt,count,A,B,kq : LongInt;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M,nA,nB);
        FillChar(IsA,SizeOf(IsA),false);
        FillChar(IsB,SizeOf(IsB),false);
        For i:=1 to nA do
            Begin
                if i=nA then Readln(f,j) else Read(f,j);
                IsA[j]:=true;
            End;
        For i:=1 to nB do
            Begin
                if i=nB then Readln(f,j) else Read(f,j);
                IsB[j]:=true;
            End;
        FillChar(Head,SizeOf(Head),0);
        For i:=1 to M do
            Begin
                Readln(f,u,v);
                LinkI[i]:=Head[u];
                LinkJ[i]:=Head[v];
                Head[u]:=i;
                Head[v]:=i;
                II[i]:=u;
                JJ[i]:=v;
                DK[i]:=true;
            End;
        Close(f);
    End;

Procedure FindChild (x : LongInt);
    Var vt,y : LongInt;
    Begin
        TPLT[x]:=stplt;
        if IsA[x] then ChildA[x]:=1 else ChildA[x]:=0;
        if IsB[x] then ChildB[x]:=1 else ChildB[x]:=0;
        if IsA[x] then inc(DemA[stplt]);
        if IsB[x] then inc(DemB[stplt]);
        vt:=Head[x];
        Repeat
            if vt=0 then exit;
            if x=II[vt] then y:=JJ[vt] else y:=II[vt];
            if TPLT[y]=0 then
                Begin
                    FindChild(y);
                    inc(ChildA[x],ChildA[y]);
                    inc(ChildB[x],ChildB[y]);
                End;
            if x=II[vt] then vt:=LinkI[vt] else vt:=LinkJ[vt];
        Until false;
    End;

Procedure DFS (x : LongInt);
    Var vt,y : LongInt;
    Begin
        inc(count);
        Num[x]:=count;
        Low[x]:=count;
        vt:=Head[x];
        Repeat
            if vt=0 then exit;
            if x=II[vt] then y:=JJ[vt] else y:=II[vt];
            if not DK[vt] then
                Begin
                    if x=II[vt] then vt:=LinkI[vt] else vt:=LinkJ[vt];
                    continue;
                End;
            DK[vt]:=false;
            if P[y]=0 then
                Begin
                    P[y]:=x;
                    DFS(y);
                    Low[x]:=min(Low[x],Low[y]);
                End else Low[x]:=min(Low[x],Num[y]);
            if x=II[vt] then vt:=LinkI[vt] else vt:=LinkJ[vt];
        Until false;
    End;

Procedure XuLy;
    Begin
        FillChar(ChildA,SizeOf(ChildA),0);
        FillChar(ChildB,SizeOf(ChildB),0);
        FillChar(TPLT,SizeOf(TPLT),0);
        stplt:=0;
        For i:=1 to N do
            if TPLT[i]=0 then
                Begin
                        inc(stplt);
                        FindChild(i);
                End;
        //------------//
        FillChar(P,SizeOf(P),0);
        count:=0;
        For i:=1 to N do
            if P[i]=0 then
                Begin
                    P[i]:=-1;
                    DFS(i);
                End;
        kq:=0;
        For j:=1 to N do
            Begin
                i:=P[j];
                if i=-1 then continue;
                if Low[j]=Num[j] then
                    Begin
                        A:=min(ChildA[i],ChildA[j]);
                        B:=min(ChildB[i],ChildB[j]);
                        if (A=DemA[TPLT[j]]) or (B=DemB[TPLT[j]]) or (A=0) or (B=0) then inc(kq);
                    End;
            End;
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
