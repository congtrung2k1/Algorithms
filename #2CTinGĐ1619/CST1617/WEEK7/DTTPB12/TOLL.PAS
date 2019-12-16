Program TOLL;
Const
    fi='TOLL.INP';
    fo='TOLL.OUT';
    base=10000000;
Var
    g,f : Text;
    M,i,j,u,v,test,s,t,front,rear : LongInt;
    C1,C3,C2 : Char;
    P   : Int64;
    A   : Array[0..60,0..60] of Boolean;
    DSK : Array[0..60,0..60] of LongInt;
    soluong,Trace : Array[0..60] of LongInt;
    D   : Array[0..60] of Int64;
    Q   : Array[0..base+1] of LongInt;
    InQ : Array[0..60] of Boolean;
    SKQ : String;

Function Chuyen (C : Char) : LongInt;
    Begin
        if (C>='a') and (C<='z') then exit(ORD(C)-96);
        exit(ORD(C)-64+26);
    End;

Function ChuyenN (C : LongInt) : Char;
    Begin
        if (C<=26) then exit(CHR(C+96));
        exit(CHR(C-26+64));
    End;

Function Tinh : Int64;
    Var xxx : Int64;
    Begin
        if v<=26 then exit(1);
        xxx:=D[u] div 20;
        if (D[u] mod 20)=0 then exit(xxx) else exit(xxx+1);
    End;

Function SPFA (start : Int64) : Boolean;
    Begin
        FillChar(D,SizeOf(D),0);
        D[s]:=start;
        if start=19 then
            Begin
                start:=19;
            End;
        FillChar(InQ,SizeOf(InQ),false);
        front:=1; rear:=1; Q[1]:=s;
        Repeat
            u:=Q[front mod base];
            InQ[u]:=false;
            For i:=1 to soluong[u] do
                Begin
                    v:=DSK[u,i];
                    if (D[v]<D[u]-Tinh) then
                        Begin
                            D[v]:=D[u]-Tinh;
                            Trace[v]:=u;
                            if (v=t) and (D[v]>=P) then exit(true);
                            if InQ[v] then continue;
                            InQ[v]:=true;
                            inc(rear);
                            Q[rear mod base]:=v;
                        End;
                End;
            inc(front);
        Until front>rear;
        if D[t]>=P then exit(true) else exit(false);
    End;


Procedure XuLy;
    Var l,r,x,nho : Int64;
    Begin
        l:=P; r:=P*20*60;
        Repeat
            x:=(l+r) div 2;
            if SPFA(x) then
                Begin
                    nho:=x;
                    r:=x-1;
                End else l:=x+1;
        Until l>r;
        //-------------------------------//
        V:=s;
        Writeln(g,nho+tinh);
        FillChar(Trace,SizeOf(Trace),0);
        SPFA(nho);
        v:=t;
        SKQ:='';
        Repeat
            SKQ:=ChuyenN(v)+SKQ;
            if v=s then break;
            SKQ:='-'+SKQ;
            v:=Trace[v];
        Until false;
        Writeln(g,SKQ);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    test:=0;
    Repeat
        if EOF(f) or seekEOF(f) then break;
        Readln(f,M);
        if M=-1 then break;
        inc(test);
        Writeln(g,'#',test);
        FillChar(A,SizeOf(A),false);
        FillChar(soluong,SizeOf(soluong),0);
        For i:=1 to M do
            Begin
                Readln(f,C1,C3,C2);
                u:=Chuyen(C1);
                v:=Chuyen(C2);
                if A[u,v] then continue;
                A[u,v]:=true;
                A[v,u]:=true;
                inc(soluong[u]);
                DSK[u,soluong[u]]:=v;
                inc(soluong[v]);
                DSK[v,soluong[v]]:=u;
            End;
        Read(f,P,C1);
        Readln(f,C1,C3,C2);
        s:=Chuyen(C1);
        t:=Chuyen(C2);
        XuLy;
    Until false;
    Close(f);
    Close(g);
End.



