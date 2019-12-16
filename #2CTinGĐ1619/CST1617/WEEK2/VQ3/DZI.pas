Uses math;
Const
    fi='DZI.INP';
    fo='DZI.OUT';
Var
    g,f : Text;
    A   : Array[0..2001,0..2001] of LongInt;
    X,L,R,Stack   : Array[0..2001] of LongInt;
    N,i,j,cc,kq,S,top : LongInt;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        For i:=1 to N do
            For j:=1 to N do
                Begin
                    Read(f,A[i,j]);
                    A[i,j]:=abs(A[i,j]-1);
                    if A[i,j]=0 then continue;
                    inc(A[i,j],A[i-1,j]);
                End;
        Close(f);
    End;

Procedure FindMax (vt : LongInt);
    Begin
        For j:=1 to N do
            Begin
                X[j]:=A[vt,j];
                L[j]:=0;
                R[j]:=N+1;
            End;
        top:=0;
        For i:=1 to N do
            Begin
                While (top>0) and (X[i]<X[Stack[top]]) do
                    Begin
                        R[Stack[top]]:=i;
                        dec(top);
                    End;
                inc(top);
                Stack[top]:=i;
            End;
        top:=0;
        For i:=N downto 1 do
            Begin
                While (top>0) and (X[i]<X[Stack[top]]) do
                    Begin
                        L[Stack[top]]:=i;
                        dec(top);
                    End;
                inc(top);
                Stack[top]:=i;
            End;
        For i:=1 to N do
            Begin
                S:=X[i]*(R[i]-L[i]-1);
                kq:=max(kq,S);
            End;
    End;

Procedure Try;
    Begin
        kq:=0;
        For cc:=1 to N do FindMax(cc);
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
