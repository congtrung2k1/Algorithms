Const
        fi='CHIPHI.INP';
        fo='CHIPHI.OUT';
        inf=1000000000;
Type
        luu = record
                t1,t2 : Integer;
                C     : LongInt;
        End;
Var
        g,f : Text;
        De  : Array[1..400] of luu;
        A   : Array[1..400,1..400] of LongInt;
        CoDinh : Array[1..400] of Boolean;
        P   : Array[1..400] of LongInt;
        N,K,canh,canhtmp : Integer;
        i,j,M : LongInt;
        hv  : luu;
        SKQ : String;

Procedure DocFile;
        Begin
                Assign(f,fi); Reset(f); Readln(f,N,K);
                M:=(N*(N-1)) div 2;
                For i:=1 to M do Readln(f,De[i].t1,De[i].t2,De[i].C);
                Close(f);
        End;

Procedure QSort (l,r : Integer);
        Var i1,j1 : Integer;
                x : LongInt;
        Begin
                If l>=r then exit;
                i1:=l;
                j1:=r;
                x:=De[(l+r) div 2].C;
                Repeat
                        While De[i1].C<x do inc(i1);
                        While De[j1].C>x do dec(j1);
                        If i1<=j1 then
                                Begin
                                        hv:=De[i1];
                                        De[i1]:=De[j1];
                                        De[j1]:=hv;
                                        inc(i1);
                                        dec(j1);
                                End;
                Until i1>j1;
                QSort(l,j1); QSort(i1,r);
        End;

Procedure Dijkstra (dau,cuoi : Integer);
        Var u,vt : Integer;
                mini : LongInt;
        Begin
                u:=dau;
                FillChar(CoDinh,SizeOf(CoDinh),false);
                For i:=1 to N do P[i]:=inf;
                P[u]:=0;
                CoDinh[u]:=true;
                Repeat
                        mini:=inf;
                        For i:=1 to N do
                                Begin
                                        If (A[u,i]>0) and (P[u]+A[u,i]<P[i]) and (CoDinh[i]=false) then P[i]:=P[u]+A[u,i];
                                        If (P[i]<mini) and (CoDinh[i]=false) then
                                                Begin
                                                        mini:=P[i];
                                                        vt:=i;
                                                End;
                                End;
                        If mini=inf then break;
                        If vt=cuoi then break;
                        u:=vt;
                        CoDinh[u]:=true;
                Until false;
                If P[cuoi]<De[j].C then
                        Begin
                                SKQ:='NO';
                                exit;
                        End;
                If P[cuoi]>De[j].C then
                        Begin
                                inc(canh);
                                A[dau,cuoi]:=De[j].C;
                                A[cuoi,dau]:=De[j].C;
                                exit;
                        End;
                If P[cuoi]=De[j].C then
                        Begin
                                inc(canhtmp);
                                exit;
                        End;
        End;

Procedure XuLy;
        Begin
                For i:=1 to N do
                        For j:=1 to N do A[i,j]:=0;
                SKQ:='YES';
                canh:=0;
                canhtmp:=0;
                For j:=1 to M do
                        Begin
                                Dijkstra(De[j].t1,De[j].t2);
                                If SKQ='NO' then exit;
                        End;
        End;

Procedure GhiFile;
        Begin
                Assign(g,fo); Rewrite(g);
                If SKQ='NO' then
                        Begin
                                Write(g,SKQ);
                                Close(g);
                                exit;
                        End;
                If canh>K then SKQ:='NO';
                If canh=K then SKQ:='YES';
                If (canh<K) and (canh+canhtmp>=K) then SKQ:='YES';
                If (canh<K) and (canh+canhtmp<K) then SKQ:='NO';
                Write(g,SKQ);
                Close(g);
        End;


Begin
        DocFile;
        QSort(1,M);
        XuLy;
        GhiFile;
End.

