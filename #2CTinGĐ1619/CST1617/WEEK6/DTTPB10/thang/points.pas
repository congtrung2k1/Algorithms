Const
    fi='POINTS.INP';
    fo='POINTS.OUT';
Var
    f,g : Text;
    x,y : Array[0..5] of Int64;
    a : Array[0..2,0..2] of Int64;
    N : LongInt;
    kq : Int64;

Procedure Data;
    Var u,v,i : LongInt;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N);
        FillChar(a,SizeOf(A),0);
        For i:=1 to N do
            Begin
                Readln(f,u,v);
                u:=u mod 2;
                v:=v mod 2;
                a[u,v]:=a[u,v]+1;
            End;
        Close(f);
    End;

Procedure solve;
    Var i,j,k : LongInt;
        u,v,t,tmp : Int64;
    Begin
        x[1]:=0; y[1]:=0;
        x[2]:=0; y[2]:=1;
        x[3]:=1; y[3]:=0;
        x[4]:=1; y[4]:=1;
        kq:=0;
        For i:=1 to 4 do
            For j:=i to 4 do
                For k:=j to 4 do
                    Begin
                        tmp:=(x[i]-x[j])*(y[i]+y[j])+(x[j]-x[k])*(y[j]+y[k])+(x[k]-x[i])*(y[k]+y[i]);
                        if tmp<0 then tmp:=0-tmp;
                        if (tmp mod 2)=1 then continue;
                        u:=a[X[i],Y[i]];
                        v:=a[X[j],Y[j]];
                        t:=a[X[k],Y[k]];
                        if (i<>j) and (j<>k) and (i<>k) then tmp:=u*v*t;
                        if (i=j) and (i=k) then tmp:=(u*(u-1)*(u-2)) div 6;
                        if (i=j) and (i<>k) then tmp:=((u*(u-1)) div 2)*t;
                        if (i=k) and (i<>j) then tmp:=((u*(u-1)) div 2)*v;
                        if (i<>j) and (j=k) then tmp:=((v*(v-1)) div 2)*u;
                        kq:=kq+tmp;
                    End;
    End;

Procedure print;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
    data;
    Solve;
    print;
End.

