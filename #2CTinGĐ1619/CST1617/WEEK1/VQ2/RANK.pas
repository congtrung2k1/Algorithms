Const
    fi='RANK.INP';
    fo='RANK.OUT';
Type
    DSC_data=record
        ii,jj : LongInt;
            End;
Var
    g,f : Text;
    Head,Link : Array[0..10001] of LongInt;
    DSC : Array[0..10001] of DSC_data;
    N,M,i,j,u,v,kq : LongInt;
    D   : Array[0..1001,0..1001] of Boolean;
    Free: Array[0..1001] of Boolean;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        FillChar(Head,SizeOf(Head),0);
        For i:=1 to M do
            Begin
                Readln(f,u,v);
                Link[i]:=Head[u];
                Head[u]:=i;
                DSC[i].ii:=u;
                DSC[i].jj:=v;
            End;
        Close(f);
    End;

Procedure DFS (x : LongInt);
    Var y,vt : LongInt;
    Begin
        Free[x]:=false;
        D[i,x]:=true;
        D[x,i]:=true;
        vt:=Head[x];
        Repeat
            if vt=0 then break;
            y:=DSC[vt].jj;
            if (Free[y]) then DFS(y);
            vt:=Link[vt];
        Until false;
    End;

Procedure XuLy;
    Begin
        FillChar(D,SizeOf(D),false);
        For i:=1 to N do
            Begin
                FillChar(Free,SizeOf(Free),true);
                DFS(i);
            End;
        kq:=0;
        For i:=1 to N-1 do
            For j:=i+1 to N do
                if not D[i,j] then inc(kq);
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
