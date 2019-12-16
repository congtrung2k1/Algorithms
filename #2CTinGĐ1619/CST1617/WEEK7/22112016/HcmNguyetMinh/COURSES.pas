Const
    fi='COURSES.INP';
    fo='COURSES.OUT';
    base=200007;
Var
    g,f : Text;
    test,i,j,N,swap,kq : LongInt;
    S   : Array[0..100001] of String[30];
    Len,H : Array[0..100001] of LongInt;
    Mark  : Array[0..base] of Boolean;
    swapS : String[30];

Procedure QSort (l,r : LongInt);
    Var i1,j1,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        x:=Len[l+Random(r-l+1)];
        Repeat
            While Len[i1]<x do inc(i1);
            While Len[j1]>x do dec(j1);
            if i1<=j1 then
                Begin
                    swap:=Len[i1];
                    Len[i1]:=Len[j1];
                    Len[j1]:=swap;
                    swapS:=S[i1];
                    S[i1]:=S[j1];
                    S[j1]:=swapS;
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1); QSort(i1,r);
    End;

Procedure Check (S1 : String);
    Var chay,t : LongInt; hash : Int64;
    Begin
        hash:=0;
        For chay:=1 to Length(S1) do
            Begin
                if S1[chay]='_' then t:=26 else
                    t:=ORD(S1[chay])-97;
                hash:=(hash*27+t) mod base;
                if Mark[hash] then exit;
            End;
        inc(kq);
        Mark[hash]:=true;
        H[i]:=hash;
    End;

Begin
    Randomize;
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,test);
    For test:=1 to test do
        Begin
            For i:=1 to N do
                Begin
                    Mark[H[i]]:=false;
                    H[i]:=0;
                End;
            Readln(f,N);
            For i:=1 to N do
                Begin
                    Readln(f,S[i]);
                    Len[i]:=Length(S[i]);
                End;
            QSort(1,N);
            kq:=0;
            For i:=1 to N do Check(S[i]);
            Writeln(g,kq);
        End;
    Close(f);
    Close(g);
End.

