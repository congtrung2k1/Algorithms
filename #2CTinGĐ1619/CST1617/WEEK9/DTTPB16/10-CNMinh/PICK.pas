Uses math;
Const
    fi='PICK.INP';
    fo='PICK.OUT';
Var
    g,f : Text;
    M,N,i,j,u,v,kq,vt,k : LongInt;
    A : Array[0..1001,0..1001] of Boolean;
    Last : Array[0..1001] of LongInt;

Procedure XuLy;
    Begin
        For i:=1 to N do Last[i]:=M+1;
        kq:=0;
        For i:=1 to N do
            Begin
                While (not A[i,Last[i]]) and (Last[i]>0) do dec(Last[i]);
                if Last[i]=0 then continue;
                inc(kq);
                j:=Last[i];
                For k:=i+1 to N do
                    Begin
                        While (not A[k,Last[k]]) and (Last[k]>0) do dec(Last[k]);
                        if Last[k]=0 then continue;
                        if Last[k]>=j then
                            Begin
                                vt:=Last[k];
                                Last[k]:=j-1;
                                j:=vt;
                            End;
                    End;
            End;
        Writeln(g,kq);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Repeat
        FillChar(A,SizeOf(A),false);
        Readln(f,u,v);
        if (u=-1) then break;
        A[u,v]:=true;
        N:=u;
        M:=v;
        Repeat
            Readln(f,u,v);
            if (u<1) then break;
            A[u,v]:=true;
            N:=max(N,u);
            M:=max(M,v);
        Until false;
        XuLy;
    Until false;
    Close(f);
    Close(g);
End.
