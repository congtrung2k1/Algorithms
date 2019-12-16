Const
    fi='XOSO.INP';
    fo='XOSO.OUT';
    maxi=100000;
Var
    g,f : Text;
    N,i,j,t1,t2,u,v : LongInt;
    FT  : Array[0..100001] of LongInt;

Function Query (x : LongInt) : LongInt;
    Var sum : LongInt;
    Begin
        sum:=0;
        While x>0 do
            Begin
                inc(sum,FT[x]);
                x:=x-(x and (-x));
            End;
        exit(sum);
    End;

Procedure Update (x,y : LongInt);
    Begin
        While (x<=maxi) do
            Begin
                inc(Ft[x],y);
                x:=x+(x and (-x));
            End;
    End;

Procedure Range (x,y,gt : LongInt);
    Begin
        Update(x,gt);
        Update(y+1,0-gt);
    End;

Begin
    Assign(f,fi);
    Reset(f);
    Assign(g,fo);
    Rewrite(g);
    Readln(f,N);
    FillChar(Ft,SizeOf(Ft),0);
    For i:=1 to N do
        Begin
            Readln(f,u,v);
            t1:=Query(u);
            t2:=Query(v);
            Writeln(g,t1+t2);
            Range(u,u,0-t1);
            Range(v,v,0-t2);
            Range(u+1,v-1,1);
        End;
    Close(f);
    Close(g);
End.
