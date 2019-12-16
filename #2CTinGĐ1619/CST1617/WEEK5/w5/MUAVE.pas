Const
    fi='MUAVE.INP';
    fo='MUAVE.OUT';
Var
    g,f : Text;
    N,i,j,top : LongInt;
    KQ: int64;
    A,Stack   : Array[0..500005] of LongInt;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        For i:=1 to N do Readln(f,A[i]);
        Close(f);
    End;

Function TKNP : LongInt;
    Var l,r,x,nho : LongInt;
    Begin
        l:=1; r:=top; nho:=0;
        Repeat
            x:=(l+r) div 2;
            if Stack[x]>A[i] then
                Begin
                    nho:=x;
                    l:=x+1;
                End else r:=x-1;
        Until l>r;
        if nho=0 then exit(1) else exit(nho);
    End;

Procedure Try;
    Begin
        kq:=0;
        top:=0;
        For i:=1 to N do
            Begin
                j:=TKNP;
                inc(kq,top-j+1);
                While (top>0) and (Stack[top]<A[i]) do dec(top);
                inc(top);
                Stack[top]:=A[i];
            End;
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
