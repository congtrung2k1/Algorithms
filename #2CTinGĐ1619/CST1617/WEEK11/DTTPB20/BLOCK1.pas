Program BLOCK;
Uses math;
Const
    fi='BLOCK.INP';
    fo='BLOCK.OUT';
Var
    g,f : Text;
    A,B : Array[0..201] of LongInt;
    Fx : Array[0..201,0..201] of LongInt;
    test,N,M,i,j,tmp,k,t1,t2,t3 : LongInt;

Function Tinh (x,y : LongInt) : LongInt;
    Begin
        if A[x]=A[y] then exit(sqr(A[x]+A[y]));
        exit(sqr(A[x])+sqr(A[y]));
    End;

Procedure GetAns;
    Begin
        For i:=1 to N do
            Begin
                Fx[i,i]:=A[i]*A[i];
                if i=N then break;
                Fx[i,i+1]:=Tinh(i,i+1);
            End;
        For k:=2 to (N-1) do
            For i:=1 to (N-k) do
                Begin
                    j:=i+k;
                    t1:=A[i]*A[i]+Fx[i+1,j];
                    t2:=A[j]*A[j]+Fx[i,j-1];
                    t3:=Tinh(i,j)+Fx[i+1,j-1];
                    Fx[i,j]:=max(t1,t2);
                    Fx[i,j]:=max(Fx[i,j],t3);
                End;
        Writeln(g,Fx[1,N]);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    //---------//
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,M);
            tmp:=0;
            N:=0;
            For i:=1 to M do
                Begin
                    if i=M then Readln(f,B[i]) else Read(f,B[i]);
                    if (i=1) or (B[i]=B[i-1]) then inc(tmp) else
                        Begin
                            inc(N);
                            A[N]:=tmp;
                            tmp:=1;
                        End;
                End;
            inc(N);
            A[N]:=tmp;
            GetAns;
        End;
    //---------//
    Close(f);
    Close(g);
End.