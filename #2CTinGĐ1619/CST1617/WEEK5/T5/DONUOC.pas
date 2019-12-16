Program DONUOC;
Uses math;
Const
    fi='DONUOC.INP';
    fo='DONUOC.OUT';
Var
    g,f : Text;
    N,P,i,j,tmp : LongInt;
    A : Array[1..4] of LongInt;
    Alr : Array[0..64,0..64,0..64,0..64] of Boolean;


Procedure DocFile;
    Begin
         Assign(f,fi);
         Reset(f);
         Readln(f,N,P);
         For i:=1 to N do Read(f,A[i]);
         Close(f);
    End;

Procedure TH1;
    Begin
        if A[1]<=A[2] then tmp:=0 else tmp:=A[1]-A[2];
        Assign(g,fo);
        Rewrite(g);
        if tmp<>P then Write(g,'No') else
            Begin
                tmp:=A[1]-tmp;
                Write(g,tmp);
            End;
        Close(g);
    End;

Begin
    DocFile;
    if N=2 then TH1 else
        Begin
            Assign(g,fo);
            Rewrite(g);
            Write(g,'No');
            Close(g);
        End;
End.