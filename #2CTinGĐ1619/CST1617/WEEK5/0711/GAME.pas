Program GAME;
Uses math;
Const
    fi='GAME.INP';
    fo='GAME.OUT';
Var
    g,f : Text;
    A   : Array[0..1001,0..1001] of Boolean;
    P,visit   : Array[0..1001] of Boolean;
    N,root,i,j,u,v,kq : LongInt;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,root);
        FillChar(A,SizeOf(A),false);
        For i:=1 to N-1 do
            Begin
                Readln(f,u,v);
                A[u,v]:=true;
                A[v,u]:=true;
            End;
        Close(f);
    End;

Procedure DFS (x : LongInt);
    Var y : LongInt;
    Begin
        visit[x]:=true;
        For y:=1 to N do
            if A[x,y] and (not visit[y]) then
                Begin
                    DFS(y);
                    if not P[y] then P[x]:=true;
                End;
    End;

Procedure XuLy;
    Begin
        FillChar(visit,SizeOf(visit),false);
        FillChar(P,SizeOf(P),false);
        DFS(root);
        if not P[root] then kq:=0 else
        For i:=1 to N do
            if A[i,root] and (not P[i]) then
                Begin
                    kq:=i;
                    exit;
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
