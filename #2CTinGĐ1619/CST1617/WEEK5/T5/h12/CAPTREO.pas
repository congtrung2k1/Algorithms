Const fi='CAPTREO.INP';
        fo='CAPTREO.OUT';
        oo=trunc(1e9);
        maxn=1000;
Var c:Array[1..maxn,1..maxn] Of Longint;
        kt:Array[1..maxn] Of Boolean;
        d:Array[1..maxn] Of Longint;
        n,m:Longint;
        f,g:Text;
Procedure Data;
Var u,v:Longint;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For m:=1 to m do
        begin
                Readln(f,u,v);
                c[u,v]:=abs(u-v);
                c[v,u]:=c[u,v];
        end;
End;
Procedure djt;
Var u,v,mine,extra,add,k,du:Longint;
Begin
        Fillchar(kt,sizeof(kt),True);
        Repeat
                mine:=oo;u:=0;
                For v:=1 to n do If kt[v] and(mine>d[v]) then begin mine:=d[v];u:=v;end;
                If u=1 then Exit;
                kt[u]:=False;
                For v:=1 to n do
                begin
                        If not kt[v] then continue;
                        If c[u,v]=0 then continue;
                        extra:=(d[u] div c[u,v]) mod 2;
                        du:=d[u] mod c[u,v];
                        If du<>0 then
                        begin
                                If extra<>0 then
                                begin
                                        If u<v then add:=2*c[u,v]-du
                                        Else add:=c[u,v]-du;
                                end
                                Else
                                begin
                                        If u>v then add:=2*c[u,v]-du
                                        Else add:=c[u,v]-du;
                                end;
                        end
                        Else
                        begin
                                If extra<>0 then
                                begin
                                        If u<v then add:=0
                                        Else add:=c[u,v];
                                end
                                ELse
                                begin
                                        If u>v then add:=0
                                        Else add:=c[u,v];
                                end;
                        end;
                        If d[v]>c[u,v]+d[u]+add then d[v]:=c[u,v]+d[u]+add;
                end;
        Until false;
End;
Procedure Solve;
Var i:Longint;
Begin
        For i:=1 to n do d[i]:=oo;
        d[n]:=0;
        djt;
        Writeln(g,d[1]*2);
End;
BEGIN
        Data;
        solve;
        Close(f);Close(g);
END.