Uses math;
Const
    fi='QPATH.INP';
    fo='QPATH.OUT';
Var
    g,f : Text;
    DSK : Array[0..1001,0..1001] of LongInt;
    A,Cau,BL : Array[0..1001,0..1001] of Boolean;
    soluong,TPLT,Num,Low,P,Trace,O : Array[0..1001] of LongInt;
    Free : Array[0..1001] of Boolean;
    N,K,i,j,u,v,stplt,count,nCau,nO,le : LongInt;
    dk : Boolean;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Read(f,N,K);
        FillChar(A,SizeOf(A),false);
        For i:=1 to N do
            Begin
                soluong[i]:=0;
                Repeat
                    Read(f,j);
                    A[i,j]:=true;
                    if j=0 then break;
                    inc(soluong[i]);
                    DSK[i,soluong[i]]:=j;
                Until false;
            End;
        Close(f);
    End;

Procedure TimTPLT (x : LongInt);
    Var y,chay : LongInt;
    Begin
        TPLT[x]:=stplt;
        For chay:=1 to soluong[x] do
            Begin
                y:=DSK[x,chay];
                if TPLT[y]=0 then TimTPLT(y);
            End;
    End;

Function TimDinhLe : LongInt;
    Begin
        FillChar(TPLT,SizeOf(TPLT),0);
        stplt:=0;
        For i:=1 to N do
            if TPLT[i]=0 then
                Begin
                    inc(stplt);
                    TimTPLT(i);
                End;
        For i:=1 to N do
            if (TPLT[i]=TPLT[K]) and (i<>K) and (odd(soluong[i])) then exit(i);
        exit(-1);
    End;

Procedure Visit (x : LongInt);
    Var y : LongInt;
    Begin
        inc(count);
        Num[x]:=count;
        Low[x]:=count;
        For y:=1 to N do
            if A[x,y] then
                Begin
                    A[y,x]:=false;
                    if Num[y]>0 then Low[x]:=min(Low[x],Num[y]) else
                        Begin
                            P[y]:=x;
                            Visit(y);
                            Low[x]:=min(Low[x],Low[y]);
                        End;
                End;
    End;

Procedure Outp (x : LongInt);
    Var chay,y : LongInt;
    Begin
        Free[x]:=false;
        For chay:=1 to soluong[x] do
            Begin
                y:=DSK[x,chay];
                if Free[y] then
                    Begin
                        Trace[y]:=x;
                        if Cau[x,y] or Cau[y,x] then
                            Begin
                                Writeln(g,y);
                                nO:=0;
                                Repeat
                                    inc(nO);
                                    O[nO]:=y;
                                    y:=Trace[y];
                                Until y=0;
                                For i:=nO downto 1 do Write(g,O[i],' ');
                                Close(g);
                                halt;
                            End;
                        Outp(y);
                    End;
            End;
    End;

Procedure DFS (x : LongInt);
    Var chay,y : LongInt;
    Begin
        Free[x]:=false;
        For chay:=1 to soluong[x] do
            Begin
                y:=DSK[x,chay];
                if (y=le) and (y<>Trace[x]) and (not BL[x,y]) then
                        Begin
                                nO:=0;
                                BL[x,y]:=true;
                                BL[y,x]:=true;
                                y:=x;
                                Repeat
                                    BL[Trace[y],y]:=true;
                                    BL[y,Trace[y]]:=true;
                                    inc(nO);
                                    O[nO]:=y;
                                    y:=Trace[y];
                                Until y=0;
                                For i:=nO downto 1 do Write(g,O[i],' ');
                                dk:=false;
                                exit;
                        End;
                if (not BL[x,y]) and (dk) and (Free[y]) then
                    Begin
                        Trace[y]:=x;
                        DFS(y);
                    End;
            End;
    End;

Procedure Try;
    Begin
        Assign(g,fo);
        Rewrite(g);
        le:=TimDinhLe;
        if le=-1 then
            Begin
                Write(g,'NO');
                Close(g);
                halt;
            End;
        Writeln(g,'YES');
        count:=0;
        FillChar(Num,SizeOf(Num),0);
        For i:=1 to N do
            if Num[i]=0 then
                Begin
                    P[i]:=-1;
                    Visit(i);
                End;
        FillChar(Cau,SizeOf(Cau),false);
        For j:=1 to N do
            Begin
                i:=P[j];
                if (TPLT[j]<>TPLT[k]) or (i=-1) then continue;
                if Low[j]=Num[j] then
                    Begin
                        inc(nCau);
                        Cau[i,j]:=true;
                    End;
            End;
        if nCau>0 then
            Begin
                FillChar(Trace,SizeOf(Trace),0);
                FillChar(Free,SizeOf(Free),true);
                Outp(K);
            End;
        FillChar(BL,SizeOf(BL),false);
        FillChar(Free,SizeOf(Free),true);
        Writeln(g,le);
        FillChar(Trace,SizeOf(Trace),0);
        dk:=true;
        DFS(K);
        For i:=1 to (soluong[le] div 2) do
            Begin
                FillChar(Free,SizeOf(Free),true);
                FillChar(Trace,SizeOf(Trace),0);
                dk:=true;
                DFS(le);
            End;
        Write(g,le);
        Close(g);
    End;

Begin
    Init;
    Try;
End.

