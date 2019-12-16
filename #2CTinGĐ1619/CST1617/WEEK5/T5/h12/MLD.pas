Const fi='MLD.INP';
        fo='MLD.OUT';
        maxn=800;
Var c,p,c1:Array[1..maxn*2+1,1..maxn*2+1] Of Longint;
        q,trace:Array[1..maxn*2+1] Of Integer;
        n,m,d,s,t:Integer;
        ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:Longint;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,m,n,d);
        Fillchar(c,sizeof(c),0);
        For u:=1 to n do c1[u,u+n]:=1;
        c1[1,1+n]:=maxint;
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                inc(u);inc(v);
                c1[u+n,v]:=1;c1[v+n,u]:=1;
                c[u,v]:=c[u,v]+ts;
                c[v,u]:=c[u,v];
        end;
ENd;
Function find:Boolean;
Var u,v,first,last:Integer;
Begin
        Fillchar(trace,sizeof(trace),0);
        Fillchar(q,sizeof(q),0);
        trace[1]:=t+1;
        q[1]:=s;first:=1;last:=1;
        Repeat
                u:=q[first];inc(first);
                For v:=1 to n do
                        If (trace[v]=0)and(c[u,v]>p[u,v]) then
                        begin
                                inc(last);
                                trace[v]:=u;
                                q[last]:=v;
                                If v=t then Exit(true);
                        end;
        Until First>last;
        Exit(False);
End;
Procedure incflow;
Var delta:Longint;
        u,v:Integer;
Begin
        delta:=maxlongint;
        v:=t;
        Repeat
                u:=trace[v];
                If delta>c[u,v]-p[u,v] then delta:=c[u,v]-p[u,v];
                v:=u;
        Until v=s;
        ans:=ans+delta;
        v:=t;
        Repeat
                u:=trace[v];
                p[u,v]:=p[u,v]+delta;
                p[v,u]:=p[v,u]-delta;
                v:=u;
        Until v=s;
End;
Procedure sol1;
Begin
        s:=1;t:=n;
        ans:=0;
        Repeat
                If find then incflow
                Else break;
        Until false;
        writeln(g,ans);
End;
Function find1:Boolean;
Var u,v,first,last:Integer;
Begin
        Fillchar(trace,sizeof(trace),0);
        Fillchar(q,sizeof(q),0);
        trace[1]:=t+1;
        q[1]:=s;first:=1;last:=1;
        Repeat
                u:=q[first];inc(first);
                For v:=1 to t do
                        If (trace[v]=0)and(c1[u,v]>p[u,v]) then
                        begin
                                inc(last);
                                trace[v]:=u;
                                q[last]:=v;
                                If v=t then Exit(true);
                        end;
        Until First>last;
        Exit(False);
End;
Procedure incflow1;
Var delta:Longint;
        u,v:Integer;
Begin
        delta:=maxlongint;
        v:=t;
        Repeat
                u:=trace[v];
                If delta>c1[u,v]-p[u,v] then delta:=c1[u,v]-p[u,v];
                v:=u;
        Until v=s;
        ans:=ans+delta;
        v:=t;
        Repeat
                u:=trace[v];
                p[u,v]:=p[u,v]+delta;
                p[v,u]:=p[v,u]-delta;
                v:=u;
        Until v=s;
End;
Procedure sol2;
Var u:Integer;
Begin
        Fillchar(p,sizeof(p),0);
        s:=1;t:=n*2+1;
        For d:=1 to d do
        begin
                Readln(f,u);
                inc(u);
                c1[u,t]:=maxint;
        end;
        ans:=0;
        Repeat
                If find1 then incflow1
                Else break;
        Until false;
        writeln(g,ans);
End;
BEGIN
        Data;
        sol1;
        sol2;
        Close(f);Close(g);
END.