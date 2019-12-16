Const
    fi='BSEQ.INP';
    fo='BSEQ.OUT';
Var
    g,f : Text;
    OK : Array[0..31,0..31] of LongInt;
    soluong,Stack : Array[-1..30] of LongInt;
    N,i,j,tmp,k : LongInt;
    S : String;
    kq,t1,t2 : QWord;
    Free : Array[0..16] of Boolean;

Function Check (gt,top : LongInt) : Boolean;
    Var chay : LongInt;
    Begin
        if (top>0) and (Stack[top]=gt+2) or (Stack[top]=gt-2) then exit(true);
        if (top>1) and (Stack[top-1]=gt+1) or (Stack[top-1]=gt-1) then exit(true);
        For chay:=1 to top do
            Begin
                if Stack[chay]=gt then exit(true);
                if Stack[chay]=gt-(top+1-chay) then exit(true);
                if Stack[chay]=gt+(top+1-chay) then exit(true);
            End;
        exit(false);
    End;

Procedure DeQuy (x : LongInt);
    Var chay,y : LongInt;
    Begin
        For chay:=1 to soluong[x] do
            Begin
                y:=OK[x,chay];
                if Check(y,x-1) then
                    Begin
                        t1:=1;
                        For i:=x+1 to N do t1:=t1*qword(soluong[i]);
                        kq:=kq+t1;
                        continue;
                    End;
                if x=N then continue;
                Stack[x]:=y;
                DeQuy(x+1);
            End;
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Repeat
        Readln(f,N);
        if N=0 then break;
        FillChar(OK,SizeOf(OK),0);
        FillChar(soluong,SizeOf(soluong),0);
        For i:=1 to N do
            Begin
                Readln(f,S);
                if S[1]='?' then
                    Begin
                        soluong[i]:=N;
                        For j:=1 to N do OK[i,j]:=j;
                        continue;
                    End;
                For j:=1 to N do Free[j]:=true;
                For j:=1 to Length(S) do
                    Begin
                        if (S[j]<'A') and (S[j]>'Z') then break;
                        tmp:=ORD(S[j])-64;
                        if not Free[tmp] then continue;
                        Free[tmp]:=false;
                        inc(soluong[i]);
                        OK[i,soluong[i]]:=tmp;
                    End;
            End;
        kq:=0;
        DeQuy(1);
        Writeln(g,kq);
    Until EOF(f) or seekEOF(f);
    Close(f);
    Close(g);
End.
