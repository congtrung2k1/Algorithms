Const
    fi='CODAM.INP';
    fo='CODAM.OUT';
    t=1;
    d=2;
    qt=3;
    qd=4;
Var
    g,f : Text;
    A   : Array[-2..12,-2..12] of LongInt;
    test,i,j,kq,n : LongInt;
    C   : Char;

Procedure DFS (x,y,sum : LongInt);
    Begin
        if sum>kq then kq:=sum;
        if (A[x-1,y-1]=qd) and (A[x-2,y-2]=d) then
            Begin
                A[x-1,y-1]:=d;
                DFS(x-2,y-2,sum+1);
                A[x-1,y-1]:=qd;
            End;
        if (A[x-1,y+1]=qd) and (A[x-2,y+2]=d) then
            Begin
                A[x-1,y+1]:=d;
                DFS(x-2,y+2,sum+1);
                A[x-1,y+1]:=qd;
            End;
        if (A[x+1,y-1]=qd) and (A[x+2,y-2]=d) then
            Begin
                A[x+1,y-1]:=d;
                DFS(x+2,y-2,sum+1);
                A[x+1,y-1]:=qd;
            End;
        if (A[x+1,y+1]=qd) and (A[x+2,y+2]=d) then
            Begin
                A[x+1,y+1]:=d;
                DFS(x+2,y+2,sum+1);
                A[x+1,y+1]:=qd;
            End;
    End;

Procedure Try;
 Var i,j: Longint;
 Begin
 KQ:=0;
 For i:=1 to n do
  For j:=1 to n do
   If A[i,j]=QT then
    Begin
    A[i,j]:=D;
    Dfs(i,j,0);
    A[i,j]:=Qt;
    End;
 Writeln(G,KQ);
 End;

Procedure Init;
 Var i,j: Longint;
     C: Char;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  N:=10; Readln(F);
  For i:=1 to N do Begin
   For j:=1 to N do Begin
    Read(f,c);
    Case C of
    '#': A[i,j]:=D;
    '.': A[i,j]:=T;
    'B': A[i,j]:=QD;
    'W': A[i,j]:=QT;
    End;
   end;
  Readln(F);
  end;
  Try;
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
end.
