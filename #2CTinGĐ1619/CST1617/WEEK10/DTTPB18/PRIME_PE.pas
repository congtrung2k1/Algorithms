Const
    fi='PRIME_PE.INP';
    fo='PRIME_PE.OUT';
Var
    g,f : Text;
    NT : Array[0..1200001] of Boolean;
    S : Array[0..8] of LongInt;
    Free : Array[0..8] of Boolean;
    test,i,j,A,B,nS,kq,tmp : LongInt;
    dk : Boolean;

Procedure Sang;
    Begin
        FillChar(NT,SizeOf(NT),true);
        NT[1]:=false;
        NT[0]:=false;
        For i:=2 to Trunc(sqrt(1111111)) do
            Begin
                if not NT[i] then continue;
                j:=i*i;
                Repeat
                    if j>1111111 then break;
                    NT[j]:=false;
                    inc(j,i);
                Until false;
            End;
    End;

Procedure Chay (x,tong : LongInt);
    Var y : LongInt;
    Begin
        if dk then exit;
        if x=nS then
            Begin
                tmp:=abs(i-tong);
                tmp:=tmp div 9;
                if NT[tmp] then begin dk:=true; Writeln(i); end;
                exit;
            End;
        For y:=1 to nS do
            if Free[y] then
                Begin
                    if (x=0) and (S[y]=0) then continue;
                    Free[y]:=false;
                    Chay(x+1,tong*10+S[y]);
                    Free[y]:=true;
                End;
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    //-------------//
    Sang;
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,A,B);
            kq:=0;
            For i:=A to B do
                Begin
                    nS:=0;
                    j:=i;
                    While (j<>0) do
                        Begin
                            inc(nS);
                            S[nS]:=j mod 10;
                            j:=j div 10;
                        End;
                    dk:=false;
                    FillChar(Free,SizeOf(Free),true);
                    Chay(0,0);
                    if dk then inc(kq);
                End;
            Writeln(g,kq);
        End;
    //-------------//
    Close(f);
    Close(g);
End.
