Const
    fi='SORTING.INP';
    fo='SORTING.OUT';
Var
    g,f : Text;
    N,i,j,nG : LongInt;
    A,Ghi   : Array[0..3000001] of LongInt;
    visit : Array[0..3000001] of Boolean;

Procedure INIT;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,N,N);
        For i:=1 to N do Read(f,A[i]);
        Close(f);
    End;

Procedure TRY;
    Begin
        FillChar(visit,SizeOf(visit),false);
        nG:=0;
        For i:=N downto 1 do
            if not visit[A[i]] then
                Begin
                    visit[A[i]]:=true;
                    inc(nG);
                    Ghi[nG]:=A[i];
                End;
    End;

Procedure OUTP;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Writeln(g,nG);
        For i:=nG downto 1 do Write(g,Ghi[i],' ');
        Close(g);
    End;

Begin
   INIT;
   TRY;
   OUTP;
End.
