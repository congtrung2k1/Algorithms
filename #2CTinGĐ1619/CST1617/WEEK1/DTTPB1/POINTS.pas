Program POINTS;
Const
    fi='POINTS.INP';
    fo='POINTS.OUT';
Var
    g,f : Text;
    X,Y : Array[0..5] of Int64;
    A : Array[0..2,0..2] of Int64;
    N : LongInt;
    kq : Int64;

Procedure DocFile;
    Var u,v,i : LongInt;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        FillChar(A,SizeOf(A),0);
        For i:=1 to N do
            Begin
                Readln(f,u,v);
                u:=u mod 2;
                v:=v mod 2;
                A[u,v]:=A[u,v]+1;
            End;
        Close(f);
    End;

Procedure XuLy;
    Var i,j,k : LongInt;
        u,v,t,tmp : Int64;
    Begin
        X[1]:=0; Y[1]:=0;
        X[2]:=0; Y[2]:=1;
        X[3]:=1; Y[3]:=0;
        X[4]:=1; Y[4]:=1;
        kq:=0;
        For i:=1 to 4 do
            For j:=i to 4 do
                For k:=j to 4 do
                    Begin
                        tmp:=(X[i]-X[j])*(Y[i]+Y[j])+(X[j]-X[k])*(Y[j]+Y[k])+(X[k]-X[i])*(Y[k]+Y[i]);
                        if tmp<0 then tmp:=0-tmp;
                        if (tmp mod 2)=1 then continue;
                        u:=A[X[i],Y[i]];
                        v:=A[X[j],Y[j]];
                        t:=A[X[k],Y[k]];
                        if (i<>j) and (j<>k) and (i<>k) then tmp:=u*v*t;
                        if (i=j) and (i=k) then tmp:=(u*(u-1)*(u-2)) div 6;
                        if (i=j) and (i<>k) then tmp:=((u*(u-1)) div 2)*t;
                        if (i=k) and (i<>j) then tmp:=((u*(u-1)) div 2)*v;
                        if (i<>j) and (j=k) then tmp:=((v*(v-1)) div 2)*u;
                        kq:=kq+tmp;
                    End;
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.

