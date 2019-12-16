Uses math;
Const
    fi='XOASO.INP';
    fo='XOASO.OUT';
Var
    N,i,j : LongInt;
    A   : Array[0..1000001] of LongInt;
    kq  : Int64;

Begin
    Assign(input,fi); Reset(input);
    Assign(output,fo); Rewrite(output);
    Readln(N);
    For i:=1 to N do Readln(A[i]);
    kq:=0;
    For i:=1 to N-1 do
        Begin
            j:=max(A[i],A[i+1]);
            kq:=kq+int64(j);
        End;
    Write(kq);
    Close(input);
    Close(output);
End.
