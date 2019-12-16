Const
        fi='MATKHAU.INP';
        fo='MATKHAU.OUT';
Type
        luu = record
                dk1,dk2,dk3 : Int64; End;
Var
        g,f : Text;
        i,j,N : LongInt;
        kq  : Int64;
        S   : AnsiString;
        A   : Array[0..1000000] of luu;

Procedure DocFile;
        Begin
                Assign(f,fi); Reset(f); Readln(f,S); Close(f);
        End;

Function Check (tmp : Int64) : Boolean;
        Var tmp1,tmp2,tmp3 : Int64;
        Begin
                If tmp-i<5 then exit(false);
                tmp1:=A[tmp].dk1-A[i-1].dk1;
                tmp2:=A[tmp].dk2-A[i-1].dk2;
                tmp3:=A[tmp].dk3-A[i-1].dk3;
                If (tmp1>0) and (tmp2>0) and (tmp3>0) then exit(true) else exit(false);
        End;


Procedure Find (l,r : Int64);
        Var x : Int64; dk : Boolean; nho : Int64;
        Begin
                nho:=0;
                Repeat
                        x:=(l+r) div 2;
                        dk:=Check(x);
                        If dk=false then l:=x+1;
                        If dk=true then
                                Begin
                                        nho:=x;
                                        r:=x-1;
                                End;
                Until l>r;
                If nho<>0 then inc(kq,N-nho+1);
        End;

Procedure GhiFile;
        Begin
                Assign(g,fo); Rewrite(g); Write(g,kq); Close(g);
        End;


Begin
        DocFile;
        N:=Length(S);
        For i:=1 to N do
                Begin
                        A[i].dk1:=A[i-1].dk1;
                        A[i].dk2:=A[i-1].dk2;
                        A[i].dk3:=A[i-1].dk3;
                        If (S[i]>='a') and (S[i]<='z') then inc(A[i].dk1);
                        If (S[i]>='A') and (S[i]<='Z') then inc(A[i].dk2);
                        If (S[i]>='0') and (S[i]<='9') then inc(A[i].dk3);
                End;
        A[0].dk1:=0;
        A[0].dk2:=0;
        A[0].dk3:=0;
        kq:=0;
        For i:=1 to N-5 do Find(i+1,N);
        GhiFile;
End.


