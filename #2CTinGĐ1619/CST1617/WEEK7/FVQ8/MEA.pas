Uses math;
Const
    fi='MEA.INP';
    fo='MEA.OUT';
Var
    g,f : Text;
    N,i,j,t1,t2,tmp : LongInt;
    KQ: INT64;
    A,front,rear   : Array[0..5000005] of iNT64;

Procedure INIT;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        kq:=maxLongInt;
        For i:=1 to N do
            Begin
                Readln(f,A[i]);
            End;
        Close(f);
    End;

Procedure TRY;
    Begin
        A[0]:=-1000000008;
        //A[N+1]:=maxLongInt;
        kq:=maxLongInt;
        front[0]:=A[0];
        rear[0]:=A[1];
        For i:=1 to N-1 do
            Begin
                front[i]:=min(A[i]+(A[i]-rear[i-1]),A[i+1]);
                rear[i]:=min(A[i+1],A[i]+(A[i]-front[i-1]));
                kq:=min(kq,rear[i]-front[i]+1);
            End;
        If Kq=1 then kq:=0;
    End;

Procedure OUTP;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
   INIT;
   TRY;
   OUTP;
End.


