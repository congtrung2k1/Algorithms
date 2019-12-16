//PMDuc
Program PIPES;
Const
    fi='PIPES.INP';
    fo='PIPES.OUT';
Type
    DSC_data=record
        ii,jj,linki,linkj,gt : LongInt;
            dk : Boolean;
            End;
Var
    g,f : Text;
    DSC : Array[0..100100] of DSC_data;
    N,M,i,j,u,v,front,rear,NN,tmp,t1,t2 : LongInt;
    S,Bac,Head,Q,Xuoi,Nguoc,W : Array[0..100100] of LongInt;

Procedure DFS (x : LongInt);
    Var vt,y : LongInt;
    Begin
        inc(NN);
        Xuoi[x]:=NN;
        Nguoc[NN]:=x;
        vt:=Head[x];
        Repeat
            if vt=0 then exit;
            if x=DSC[vt].ii then y:=DSC[vt].jj else y:=DSC[vt].ii;
            if DSC[vt].dk then
                Begin
                    DSC[vt].dk:=false;
                    if y<>i then DFS(y);
                    DSC[vt].dk:=true;
                    break;
                End;
            if x=DSC[vt].ii then vt:=DSC[vt].linki else vt:=DSC[vt].linkj;
        Until false;
    End;


Procedure FindRest;
    Begin
        dec(front);
        if not odd(N-front) then
            Begin
                Write(g,0);
                Close(f);
                Close(g);
                halt;
            End;
         NN:=0;
         For i:=1 to N do
            if Bac[i]>1 then
                Begin
                    DFS(i);
                    break;
                End;
         tmp:=0;
         For i:=1 to NN do
            if odd(i) then inc(tmp,S[Nguoc[i]])
                else dec(tmp,S[Nguoc[i]]);
         W[NN]:=tmp div 2;
         For i:=1 to NN-1 do
            Begin
                if i=1 then tmp:=NN else tmp:=i-1;
                W[i]:=S[Nguoc[i]]-W[tmp];
            End;
         For i:=1 to M do
            if DSC[i].dk then
                Begin
                    t1:=Xuoi[DSC[i].ii];
                    t2:=Xuoi[DSC[i].jj];
                    if (t1=NN) and (t2=1) then tmp:=t1 else
                        if (t2=NN) and (t1=1) then tmp:=t2 else
                            if (t1<t2) then tmp:=t1 else tmp:=t2;
                    DSC[i].dk:=false;
                    DSC[i].gt:=W[tmp];
                End;
    End;

Procedure XuLy;
    Var vt : LongInt;
    Begin
        front:=1; rear:=0;
        For i:=1 to N do
            if Bac[i]=1 then
                Begin
                    inc(rear);
                    Q[rear]:=i;
                End;
        Repeat
            u:=Q[front];
            vt:=Head[u];
            While (not DSC[vt].dk) do
                if u=DSC[vt].ii then vt:=DSC[vt].linki
                    else vt:=DSC[vt].linkj;
            if u=DSC[vt].ii then v:=DSC[vt].jj else v:=DSC[vt].ii;
            DSC[vt].gt:=S[u];
            DSC[vt].dk:=false;
            dec(Bac[v]);
            if Bac[v]=1 then
                Begin
                    inc(rear);
                    Q[rear]:=v;
                End;
            dec(S[v],S[u]);
            inc(front);
        Until (front>rear) or (front=N);
        if (M=N) and (front<N) then FindRest;
        //-------//
        For i:=1 to M do Writeln(g,DSC[i].gt*2);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    Readln(f,N,M);
    if M>N then
        Begin
            Write(g,0);
            Close(g);
            Close(f);
            halt;
        End;
    For i:=1 to N do Readln(f,S[i]);
    FillChar(Head,SizeOf(Head),0);
    For i:=1 to M do
        Begin
            Readln(f,u,v);
            DSC[i].linki:=Head[u];
            DSC[i].linkj:=Head[v];
            DSC[i].ii:=u;
            DSC[i].jj:=v;
            Head[u]:=i;
            Head[v]:=i;
            inc(Bac[u]);
            inc(Bac[v]);
            DSC[i].dk:=true;
        End;
    XuLy;
    Close(f);
    Close(g);
End.


