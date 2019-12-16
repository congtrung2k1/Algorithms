Const
    fi='TIMSO.INP';
    fo='TIMSO.OUT';
Var
    g,f : Text;
    S,A : AnsiString;
    N,i,j,test,tong : LongInt;

Procedure Chuyen;
    Begin
        N:=0;
        tong:=1;
        For i:=1 to Length(S) do
            Begin
                j:=ORD(S[i])-48;
                inc(tong,j);
                N:=N*10+j;
            End;
    End;

Function DemSo (x : LongInt) : LongInt;
    Var TMP : LongInt;
    Begin
        TMP:=0;
        if x<0 then x:=0-x;
        While x<>0 do
            Begin
                inc(TMP,x mod 10);
                x:=x div 10;
            End;
        exit(TMP);
    End;

Procedure XuLyNho;
    Var am : Boolean;
    Begin
        if S[1]='-' then
            Begin
                am:=true;
                Delete(S,1,1);
            End else am:=false;
        if am then N:=0-N;
        Chuyen;
        If am=false then begin
        i:=N-1;
        Repeat
            if DemSo(i)=tong then
                Begin
                    Writeln(g,i);
                    exit;
                End;
            i:=i-1;
        Until false;
        end
        else
        Begin
        i:=N+1;
        Repeat
            if DemSo(i)=tong then
                Begin
                    Writeln(g,-i);
                    exit;
                End;
            i:=i+1;
        Until false;
        end
    End;

Procedure XuLyLon;
    Var AM : Boolean;
        conlai : LongInt;
    Begin
        if S[1]='-' then
            Begin
                Delete(S,1,1);
                AM:=false;
                For i:=Length(S) downto 1 do
                    if S[i]<'9' then
                        Begin
                            S[i]:=CHR(ORD(S[i])+1);
                            AM:=true;
                            break;
                        End;
                if AM then Write(g,'-') else Write(g,'-1');
                Writeln(g,S);
                exit;
            End;
         A:=S;
         A[1]:=CHR(ORD(A[1])-1);
         conlai:=2;
         AM:=false;
         For i:=2 to Length(A) do
            Begin
                if (conlai=1) and (A[i]<'9') then
                    Begin
                        A[i]:=CHR(ORD(A[i])+1);
                        AM:=true;
                        break;
                    End;
                if (conlai=2) and (A[i]='8') then
                    Begin
                        A[i]:='9';
                        conlai:=1;
                        continue;
                    End;
                if (conlai=2) and (A[i]<'8') then
                    Begin
                        A[i]:=CHR(ORD(A[i])+2);
                        AM:=true;
                        break;
                    End;
            End;
         if AM then
            Begin
                if A[1]='0' then Delete(A,1,1);
                Writeln(g,A);
                exit;
            End;
         AM:=false;
         For i:=Length(S) downto 1 do
            if S[i]<'9' then
                Begin
                    S[i]:=CHR(ORD(S[i])+1);
                    AM:=true;
                    break;
                End;
         if AM then Write(g,'-') else Write(g,'-1');
         Writeln(g,S);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    //-----------------//
    Readln(f,test);
    For test:=1 to test do
        Begin
            Readln(f,S);
            if (Length(S)<4) or ((S[1]='-') and (Length(S)<5)) then XuLyNho else XuLyLon;
        End;
    //-----------------//
    Close(f);
    Close(g);
End.
