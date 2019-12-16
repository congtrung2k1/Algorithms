//CAO NGUYET MINH
Uses math;
Const
    fi='THUNGPHIEU.INP';
    fo='THUNGPHIEU.OUT';
Var
    g,f : Text;
    N,B,i,j,x,l,r,nho,dem,maxA,kq : LongInt;
    A   : Array[0..500005] of LongInt;

Function Check (tmp : LongInt) : Boolean;
    Begin
        dem:=0;
        For i:=1 to N do
            if A[i] mod tmp=0 then
             inc(dem,A[i] div tmp) else inc(dem,(A[i] div tmp)+1);
        if dem<=B then exit(true);
        exit(false);
    End;

Function GetAns : LongInt;
    Begin
        l:=1; r:=maxA;
        Repeat
            x:=(l+r) div 2;
            if Check(x) then
                Begin
                    nho:=x;
                    r:=x-1;
                End else l:=x+1;
        Until l>r;
        exit(nho);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Repeat
        Readln(f,N,B);
        if (N=-1) then break;
        maxA:=0;
        For i:=1 to N do
            Begin
                Readln(f,A[i]);
                maxA:=max(A[i],maxA);
            End;
        Readln(f);
        kq:=GetAns;
        Writeln(g,kq);
    Until false;
    Close(g);
    Close(f);
End.

