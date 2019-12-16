Uses math;
Const
    fi='BRUNHIL.INP';
    fo='BRUNHIL.OUT';
Var
    g,f : Text;
    Fx,K,Ans : Array[0..10000001] of LongInt;
    N,test,i,j,M,tmp : LongInt;

Procedure Init;
    Begin
        Fx[1]:=K[N]-1;
        For i:=2 to 100000000 do
            Begin
                Fx[i]:=0;
                For j:=1 to N do
                    Fx[i]:=max(Fx[i],Fx[i-1]-(Fx[i-1] mod K[j])+K[j]-1);
                if (Fx[i]=Fx[i-1]) then
                    Begin
                        M:=i-1;
                        break;
                    End;
                if Fx[i]>10000000 then
                    Begin
                        M:=i;
                        break;
                    End;
            End;
        tmp:=1;
        For i:=1 to 10000000 do
            Begin
                Ans[i]:=tmp;
                if i=Fx[tmp] then inc(tmp);
                if tmp>M then break;
            End;
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    //------------//
    Readln(f,N,test);
    For i:=1 to N do
        if i=N then Readln(f,K[i]) else Read(f,K[i]);
    Init;
    For test:=1 to test do
        Begin
            Readln(f,i);
            if i>Fx[M] then
                Begin
                    Writeln(g,'oo');
                    continue;
                End;
            Writeln(g,Ans[i]);
        End;
    //------------//
    Close(f);
    Close(g);
End.
