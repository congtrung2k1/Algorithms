Const
    fi='TOMAU.INP';
    fo='TOMAU.OUT';
Var
    g,f : Text;
    A,DSK : Array[0..101,0..101] of LongInt;
    Pre : Array[0..101] of LongInt;
    N,M,i,j,kq,avail,u,v : LongInt;
    soluong : Array[0..101] of LongInt;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        For i:=1 to N do
            Begin
                inc(soluong[i]);
                DSK[i,soluong[i]]:=i;
                A[i,i]:=1;
            End;
        For i:=1 to M do
            Begin
                Readln(f,u,v);
                if A[u,v]=1 then continue;
                A[u,v]:=1;
                A[v,u]:=1;
                inc(soluong[u]);
                DSK[u,soluong[u]]:=v;
                inc(soluong[v]);
                DSK[v,soluong[v]]:=u;
            End;
        Close(f);
    End;

Procedure Update (x : LongInt);
    Var y : LongInt;
    Begin
        For y:=1 to soluong[x] do
            Begin
                if Pre[DSK[x,y]]=0 then dec(avail);
                inc(Pre[DSK[x,y]]);
            End;
    End;

Procedure DeUpdate (x : LongInt);
    Var y : LongInt;
    Begin
        For y:=1 to soluong[x] do
            Begin
                if Pre[DSK[x,y]]=1 then inc(avail);
                dec(Pre[DSK[x,y]]);
            End;
    End;

Procedure Chay (x,chosen : LongInt);
    Begin
        if chosen+avail<kq then exit;
        if x=N then
            Begin
                if chosen>kq then kq:=chosen;
                exit;
            End;
        if Pre[x+1]=0 then
            Begin
                Update(x+1);
                Chay(x+1,chosen+1);
                DeUpdate(x+1);
            End;
        Chay(x+1,chosen);
    End;

Procedure Try;
    Begin
        kq:=0;
        avail:=N;
        FillChar(Pre,SizeOf(Pre),0);
        Chay(0,0);
    End;

Procedure Outp;
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

