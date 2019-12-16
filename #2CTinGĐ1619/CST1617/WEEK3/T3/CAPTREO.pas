Program CAPTREO;
Const
        fi='CAPTREO.INP';
        fo='CAPTREO.OUT';
        inf=1000000000;
Var
        g,f : Text;
        A   : Array[0..1001,0..1001] of Boolean;
        P   : Array[0..1001] of LongInt;
        CoDinh : Array[0..1001] of Boolean;
        N,M,i,j : Integer;
Procedure DocFile;
        Var t1,t2 : Integer;
        Begin
                Assign(f,fi); Reset(f); Readln(f,N,M);
                FillChar(A,SizeOf(A),false);
                For i:=1 to N do
                        Begin
                                Readln(f,t1,t2);
                                A[t1,t2]:=true;
                                A[t2,t1]:=true;
                        End;
                Close(f);
        End;

Function Cal (x,y : Integer) : LongInt;
        Var current,t,tmp : LongInt;
        Begin
                current:=P[x]; tmp:=0;
                If y<x then t:=4*(x-y);
                If x<y then
                        Begin
                                If current<2*(y-x) then tmp:=2*(y-x);
                                If current>2*(y-x) then t:=4*(y-x);
                        End;
                If tmp<>0 then exit((tmp-current)+2*abs(x-y));
                For j:=0 to 32000 do
                        If (t*j)>=current then
                                Begin
                                        tmp:=(t*j)-current;
                                        break;
                                End;
                tmp:=tmp+2*abs(x-y);
                Exit(tmp);
        End;

Procedure Dijkstra;
        Var u,vt : Integer; mini : LongInt;
        Begin
                u:=N;
                For i:=1 to N-1 do P[i]:=inf; P[N]:=0;
                FillChar(CoDinh,SizeOf(CoDinh),false);
                CoDinh[N]:=true;
                Repeat
                        mini:=inf;
                        For i:=1 to N do
                                Begin
                                        If (A[u,i]=true) and (CoDinh[i]=false) and (P[u]+Cal(u,i)<P[i]) then P[i]:=P[u]+Cal(u,i);
                                        If (P[i]<mini) and (CoDinh[i]=false) then
                                                Begin
                                                        mini:=P[i];
                                                        vt:=i;
                                                End;
                                End;
                        If mini=inf then break;
                        If vt=1 then break;
                        u:=vt;
                        CoDinh[u]:=true;
                Until false;
        End;

Procedure GhiFile;
        Begin
                Assign(g,fo);
                Rewrite(g);
                Write(g,P[1]);
                Close(g);
        End;

Begin
        DocFile;
        Dijkstra;
        GhiFile;
End.

