Uses math;
Const
    fi='DONHANG.INP';
    fo='DONHANG.OUT';
Var
    g,f : Text;
    N,i,j,tmp,D,kq,l,r,x,re,maxi : LongInt;
    Dem,Day : Array[0..200001] of LongInt;

Procedure Init;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,tmp,D,N);
        For i:=1 to N do
            Begin
                Read(f,j);
                inc(Dem[j]);
                maxi:=max(maxi,j);
            End;
        Close(f);
    End;

Function Check (may : LongInt) : Boolean;
    Begin
        FillChar(Day,SizeOf(Day),0);
        For i:=1 to maxi do
            if Dem[i]>0 then
                Begin
                    tmp:=Dem[i];
                    For j:=i to i+D do
                        Begin
                            re:=may-Day[j];
                            if tmp<re then
                                Begin
                                    inc(Day[j],tmp);
                                    tmp:=0;
                                    break;
                                End else
                                Begin
                                    dec(tmp,re);
                                    Day[j]:=may;
                                End;
                        End;
                    if tmp>0 then exit(false);
                End;
        exit(true);
    End;


Procedure Try;
    Begin
        l:=1; r:=N;
        Repeat
            x:=(l+r) div 2;
            if Check(x) then
                Begin
                    kq:=x;
                    r:=x-1;
                End else l:=x+1;
        Until l>r;
    End;

Procedure Outp;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;


Begin
 Init;
 Try;
 Outp;
End.



