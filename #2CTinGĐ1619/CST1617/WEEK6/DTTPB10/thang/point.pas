Const fi='POINT.INP';
        fo='POINT.OUT';
Var N,cap,tmp:LongInt;
    A,Dem,B,T : Array[0..100001] of LongInt;
    Free : Array[0..100001] of Boolean;
    kt : Boolean;
    g,f : Text;
Procedure Init;
Var i:Longint;
Begin
        Assign(f,fi);Reset(f);
        Readln(f,N);
        cap:=(N*(N-1)) div 2;
        For i:=1 to cap do Read(f,A[i]);
        Close(f);
End;
Procedure Sort (l,r : LongInt);
Var i,j,x,tmp: LongInt;
Begin
        i:=l;j:=r;
        x:=A[(l+r) div 2];
        Repeat
            While A[i]<x do inc(i);
            While A[j]>x do dec(j);
            if i<=j then
            Begin
                    tmp:=A[i];A[i]:=A[j];A[j]:=tmp;
                    inc(i);dec(j);
            End;
        Until i>j;
        If l<j then Sort(l,j);
        If i<r then Sort(i,r);
End;
Function OK (top,gt : LongInt) : Boolean;
Var i : LongInt;
Begin
        if Dem[A[cap]-gt]=0 then exit(false);
        For i:=1 to top do
            if Dem[gt-B[T[i]]]=0 then exit(false);
        exit(true);
End;
Procedure Up (top,gt : LongInt);
    Var i: LongInt;
    Begin
        dec(Dem[A[cap]-gt]);
        For i:=1 to top do
            dec(Dem[gt-B[T[i]]]);
    End;
Procedure DeUp (top,gt : LongInt);
    Var i: LongInt;
    Begin
        inc(Dem[A[cap]-gt]);
        For i:=1 to top do
            inc(Dem[gt-B[T[i]]]);
    End;
Procedure DeQuy (x: LongInt);
Var i: LongInt;
Begin
        if x=N-1 then
        Begin
                For i:=1 to x do Write(B[T[i]],' ');
                Write(A[cap]);
                kt:=true;
                halt;
        End;
        For i:=T[x] to tmp do
            if OK(x,B[i]) then
            Begin
                    Up(x,B[i]);
                    T[x+1]:=i;
                    DeQuy(x+1);
                    DeUp(x,B[i]);
            End;
End;
Procedure Try;
Var i:Longint;
Begin
        Sort(1,cap);
        FillChar(Dem,SizeOf(Dem),0);
        For i:=1 to cap do inc(Dem[A[i]]);
        tmp:=0;
        For i:=1 to cap do
            if (A[i]<>A[i-1]) and (Dem[A[cap]-A[i]]>0) then
            Begin
                inc(tmp);
                B[tmp]:=A[i];
            End;
        Assign(output,fo);Rewrite(output);
        DeQuy(0);
        If kt=false then writeln(-1);
End;
Begin
        Init;
        Try;
End.
