Uses math;
Const
    fi='STMERGE.INP';
    fo='STMERGE.OUT';
    inf=1000000000;
Var
    g,f : Text;
    N,M,i,j,test,kq : LongInt;
    A,Fx,Dx : Array[0..1001,0..1001] of LongInt;

Procedure XuLy;
    Begin
        FillChar(Fx,SizeOf(Fx),0);
        FillChar(Dx,SizeOf(Dx),0);
        For i:=1 to M do Fx[0,i]:=inf;
        For i:=1 to N do Dx[i,0]:=inf;
        Fx[1,1]:=A[1,1];
        Dx[1,1]:=A[1,1];
        For i:=1 to N do
            For j:=1 to M do
                if (i<>1) or (j<>1) then
                    Begin
                        Fx[i,j]:=min(Fx[i-1,j],Dx[i-1,j]+A[i,j]);
                        Dx[i,j]:=min(Dx[i,j-1],Fx[i,j-1]+A[i,j]);
                    End;
        kq:=min(Fx[N,M],Dx[N,M]);
        Writeln(g,kq);
    End;


Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,N,M);
            For i:=1 to N do
                Begin
                    For j:=1 to M do Read(f,A[i,j]);
                    Readln(f);
                End;
            XuLy;
        End;
    Close(f);
    Close(g);
End.


