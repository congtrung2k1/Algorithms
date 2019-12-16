Const
    fi='POINT.INP';
    fo='POINT.OUT';
Var
    g,f : Text;
    N,cap,i,j,swap,tmp,dpt : LongInt;
    A,Dem,B,T : Array[0..100001] of LongInt;
    Free : Array[0..100001] of Boolean;
    dk,kt : Boolean;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        cap:=(N*(N-1)) div 2;
        For i:=1 to cap do Read(f,A[i]);
        Close(f);
    End;

Procedure QSort (l,r : LongInt);
    Var i1,j1,x : LongInt;
    Begin
        if l>=r then exit;
        i1:=l;
        j1:=r;
        x:=A[(l+r) div 2];
        Repeat
            While A[i1]<x do inc(i1);
            While A[j1]>x do dec(j1);
            if i1<=j1 then
                Begin
                    swap:=A[i1];
                    A[i1]:=A[j1];
                    A[j1]:=swap;
                    inc(i1);
                    dec(j1);
                End;
        Until i1>j1;
        QSort(l,j1);
        QSort(i1,r);
    End;

Function OK (top,gt : LongInt) : Boolean;
    Var chay : LongInt;
    Begin
        if Dem[A[cap]-gt]=0 then exit(false);
        For chay:=1 to top do
            if Dem[gt-B[T[chay]]]=0 then exit(false);
        exit(true);
    End;

Procedure Update (top,gt : LongInt);
    Var chay : LongInt;
    Begin
        dec(Dem[A[cap]-gt]);
        For chay:=1 to top do
            dec(Dem[gt-B[T[chay]]]);
    End;

Procedure De_Update (top,gt : LongInt);
    Var chay : LongInt;
    Begin
        inc(Dem[A[cap]-gt]);
        For chay:=1 to top do
            inc(Dem[gt-B[T[chay]]]);
    End;


Procedure DeQuy (x : LongInt);
    Var chay : LongInt;
    Begin
        if x=N-1 then
            Begin
                For i:=1 to x do Write(B[T[i]],' ');
                Write(A[cap]);
                kt:=true;
                halt;
            End;
        For chay:=T[x] to tmp do
            if OK(x,B[chay]) then
                Begin
                    inc(dpt,x+x);
                    Update(x,B[chay]);
                    T[x+1]:=chay;
                    DeQuy(x+1);
                    De_Update(x,B[chay]);
                End;
    End;


Procedure Try;
    Begin
        QSort(1,cap);
        FillChar(Dem,SizeOf(Dem),0);
        For i:=1 to cap do inc(Dem[A[i]]);
        tmp:=0;
        For i:=1 to cap do
            if (A[i]<>A[i-1]) and (Dem[A[cap]-A[i]]>0) then
                Begin
                    inc(tmp);
                    B[tmp]:=A[i];
                End;
        Assign(output,fo);
        Rewrite(output);
        DeQuy(0);
        If kt=false then writeln(-1);
    End;

Begin
   Init;
   Try;
End.
