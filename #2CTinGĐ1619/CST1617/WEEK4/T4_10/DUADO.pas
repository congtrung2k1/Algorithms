Const
    fi='DUADO.INP';
    fo='DUADO.OUT';
Var
    g,f : Text;
    N,M,i,j,dem,u,v,start,finish : LongInt;
    A,B : Array[0..300001] of LongInt;
    kq  : Int64;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,M);
        dem:=0;
        For i:=1 to N do
            Begin
                Readln(f,u,v);
                if u<=v then continue;
                inc(dem);
                A[dem]:=u;
                B[dem]:=v;
            End;
        Close(f);
        N:=dem;
    End;

Procedure QSort (l,r : LongInt);
    Var i1,j1,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l; j1:=r;
        x:=B[l+Random(r-l+1)];
        Repeat
            While B[i1]<x do inc(i1);
            While B[j1]>x do dec(j1);
            if i1<=j1 then
                Begin
                    u:=B[i1]; B[i1]:=B[j1]; B[j1]:=u;
                    u:=A[i1]; A[i1]:=A[j1]; A[j1]:=u;
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1); QSort(i1,r);
    End;

Procedure Try;
    Begin
        Randomize;
        QSort(1,N);
        start:=B[1];
        finish:=A[1];
        kq:=int64(M);
        B[N+1]:=M+1;
        For i:=2 to N+1 do
            if B[i]>finish then
                Begin
                    kq:=kq+int64(finish-start)+int64(finish-start);
                    start:=B[i];
                    finish:=A[i];
                End else if A[i]>finish then finish:=A[i];
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
