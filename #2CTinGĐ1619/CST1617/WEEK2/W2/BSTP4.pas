Const
    fi='BSTP.INP';
    fo='BSTP.OUT';
Var
    g,f : Text;
    test,N,M,i,j,front,rear : LongInt;
    A,Leaf,Pos   : Array[0..200001] of LongInt;
    Fx,Lo,Hi : Array[0..800001] of LongInt;

Procedure Build (x,low,high : LongInt);
    Var middle : LongInt;
    Begin
        Lo[x]:=low; Hi[x]:=high;
        if low=high then
            Begin
                Fx[x]:=A[low];
                Leaf[low]:=x;
            End else
            Begin
                middle:=(low+high) div 2;
                Build(x+x,low,middle);
                Build(x+x+1,middle+1,high);
                Fx[x]:=Fx[x+x]+Fx[x+x+1];
            End;
    End;

Procedure Update (x : LongInt);
    Begin
        if x<=1 then exit;
        Fx[x]:=Fx[x+x]+Fx[x+x+1];
        Update(x div 2);
    End;

Function Query (x : LongInt) : LongInt;
    Var t1,t2 : LongInt;
    Begin
        if (Lo[x]>rear) or (Hi[x]<front) then exit(0);
        if (Lo[x]>=front) and (Hi[x]<=rear) then exit(Fx[x]);
        t1:=Query(x+x);
        t2:=Query(x+x+1);
        exit(t1+t2);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,test);
    For test:=1 to test do
        Begin
            FillChar(A,sizeOf(A),0);
            FillChar(Fx,SizeOf(Fx),0);
            Readln(f,N,M);
            For i:=1 to N do
                Begin
                    A[i+N]:=1;
                    Pos[i]:=i+N;
                End;
            front:=N+1;
            Build(1,1,N+N);
            For i:=1 to M do
                Begin
                    Read(f,j);
                    rear:=Pos[j]-1;
                    if front<=rear then Write(g,Query(1),' ') else Write(g,'0 ');
                    Fx[Leaf[rear+1]]:=0;
                    Update((Leaf[rear+1]) div 2);
                    dec(front);
                    Fx[Leaf[front]]:=1;
                    Update((Leaf[front]) div 2);
                    Pos[j]:=front;
                End;
            Readln(f);
            Writeln(g);
        End;
    Close(f);
    Close(g);
End.

