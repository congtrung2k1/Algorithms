Uses math;
Const
    fi='VUOTNGUC.INP';
    fo='VUOTNGUC.OUT';
Var
    N,i,j,nPos,t,cur,tmp,M,u,v,front,rear,kq,NMax : LongInt;
    Pos,Closest,InP,Q,D : Array[0..100001] of LongInt;
    visit : Array[0..100001] of Boolean;
    DSK   : Array[0..100001,0..5] of LongInt;
    g,f : Text;

Procedure Khoitao;
    Begin
        nPos:=1;
        Pos[1]:=1;
        t:=0;
        cur:=1;
        InP[1]:=1;
        Repeat
            tmp:=Pos[nPos]+cur;
            if tmp>Nmax then break;
            inc(nPos);
            Pos[nPos]:=tmp;
            InP[tmp]:=nPos;
            t:=(t+1) mod 2;
            if t=0 then inc(cur);
        Until false;
        cur:=1;
        For i:=1 to Nmax do
            Begin
                if i=Pos[cur+1] then inc(cur);
                Closest[i]:=Pos[cur];
            End;
    End;

Procedure Init;
    Begin
        Assign(f,FI); Reset(F);
        Readln(f,n);
        nmax:=n;
        Readln(f,m);
        For i:=1 to m do begin readln(f,u);
         nmax:=max(nmax,u);
         End;
        Close(F);
        Assign(f,fi); Reset(f);
        Readln(f,N);
        Khoitao;
        Readln(f,M);
        For i:=1 to M do
            Begin
                Readln(f,u);
                if (u=4) or (u=6) or (u=8) then j:=1 else
                if (u=9) then j:=2 else
                    Begin
                        v:=Closest[u];
                        t:=InP[v];
                        j:=u-(Pos[t]-Pos[t-4])-1;
                    End;
                inc(DSK[u,0]);
                DSK[u,DSK[u,0]]:=j;
                inc(DSK[j,0]);
                DSK[j,DSK[j,0]]:=u;
            End;
        Close(f);
    End;

Procedure Check (x : LongInt);
    Begin
        if (x<1) or (x>Nmax) then exit;
        if visit[x] then exit;
        inc(rear);
        Q[rear]:=x;
        D[rear]:=D[front]+1;
        visit[x]:=true;
    End;

Procedure Try;
    Begin
        front:=1; rear:=1;
        Q[1]:=1; D[1]:=0;
        FillChar(visit,SizeOf(visit),false);
        visit[1]:=true;
        Repeat
            u:=Q[front];
            if u=N then
                Begin
                    kq:=D[front];
                    exit;
                End;
            Check(u+1);
            Check(u-1);
            For i:=1 to DSK[u,0] do Check(DSK[u,i]);
            inc(front);
        Until front>rear;
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
