Const
    fi='PATHS.INP';
    fo='PATHS.OUT';
Var
    g,f : Text;
    A   : Array[0..50,0..50] of Int64;
    Fx  : Array[0..40,0..20,0..501] of Int64;
    N,S,i,j,K : LongInt;
    kq,T : Int64;

Function GetAns : Int64;
    Var ans : Int64;
    Begin
        FillChar(Fx,SizeOf(Fx),0);
        For i:=1 to N do Fx[1,i,A[1,i]]:=1;
        For i:=2 to N do
            For j:=1 to A[i,0] do
                For k:=0 to S do if k>=A[i,j] then
                    Fx[i,j,k]:=Fx[i-1,j,k-A[i,j]]+Fx[i-1,j+1,k-A[i,j]];
        FOr i:=N+1 to N+N-1 do
            For j:=1 to A[i,0] do
                For k:=0 to S do if k>=A[i,j] then
                    Fx[i,j,k]:=Fx[i-1,j-1,k-A[i,j]]+Fx[i-1,j,k-A[i,j]];
        ans:=0;
        For j:=1 to A[N+N-1,0] do
            inc(ans,Fx[N+N-1,j,S]);
        exit(ans);
    End;

Procedure GetAns2;
    Var SKQ : String;
    Begin
        SKQ:='';
        For i:=1 to N do
            if Fx[N+N-1,i,S]>0 then break;
        Write(g,i-1,' ');
        k:=S;
        j:=i;
        For i:=N+N-1 downto N+1 do
            Begin
                t:=k-A[i,j];
                if Fx[i-1,j-1,t]>0 then
                    Begin
                        dec(j);
                        SKQ:=SKQ+'L'
                    End else SKQ:=SKQ+'R';
                k:=t;
            End;
        For i:=N downto 2 do
            Begin
                t:=k-A[i,j];
                if Fx[i-1,j,t]>0 then SKQ:=SKQ+'L' else
                    Begin
                        inc(j);
                        SKQ:=SKQ+'R';
                    End;
                k:=t;
            End;
        Writeln(g,SKQ);
    End;



Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Repeat
        Readln(f,N,S);
        if N=0 then break;
        j:=N;
        For i:=N+N-1 downto N do
            Begin
                A[i,0]:=j;
                For j:=1 to j do Read(f,A[i,j]);
                dec(j);
            End;
        j:=1;
        For i:=N-1 downto 1 do
            Begin
                inc(j);
                A[i,0]:=j;
                For j:=1 to j do Read(f,A[i,j]);
            End;
        //N:=N+N-1;
        kq:=GetAns;
        Writeln(g,kq);
        if kq>0 then GetAns2;
    Until false;
    Close(f);
    Close(g);
End.

