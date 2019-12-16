Uses math;
Const fi='CHIAKEO.INP';
        fo='CHIAKEO.OUT';
        maxn=202;
Var p,c:Array[1..maxn,1..maxn] Of Integer;
        trace,q:Array[1..maxn] Of Integer;
        n,m,s,t,ans,v,l,r,mid,res,u:Integer;
        f,g:Text;
Procedure Data;
Var u,v,k:Integer;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        Fillchar(p,sizeof(p),0);
        Fillchar(c,sizeof(c),0);
        For v:=1 to m do
        begin
                Read(f,k);
                For k:=1to k do
                begin
                        Read(f,u);inc(u);
                        c[u,v+n]:=1;
                end;
        end;
End;
Function find:Boolean;
Var u,v,first,last:Integer;
Begin
        Fillchar(trace,sizeof(trace),0);
        trace[s]:=t+1;
        q[1]:=s;first:=1;last:=1;
        Repeat
                u:=q[first];inc(first);
                For v:=1 to t do
                        If (trace[v]=0)and(c[u,v]>p[u,v]) then
                        begin
                                trace[v]:=u;
                                inc(last);q[last]:=v;
                                If (v=t) then Exit(True);

                        end;
        Until first>last;
        Exit(False);
End;
Procedure incflow;
Var delta,u,v:Integer;
Begin
        v:=t;delta:=maxint;
        Repeat
                u:=trace[v];
                If(c[u,v]-p[u,v]<delta) then delta:=c[u,v]-p[u,v];
                v:=u;
        Until u=s;
        v:=t;
        inc(ans,delta);
        Repeat
                u:=trace[v];
                p[u,v]:=p[u,v]+delta;
                p[v,u]:=p[v,u]-delta;
                v:=u;
        Until u=s;
ENd;
BEGIN
        Data;
        l:=1;r:=n;res:=0;
        repeat
                Fillchar(p,sizeof(p),0);
                mid:=(l+r) div 2;
                s:=n+m+1;t:=n+m+2;
                For u:=1 to n do c[s,u]:=1;
                For v:=1 to m do c[v+n,t]:=mid;
                ans:=0;
                Repeat
                        If find then incflow
                        Else break;
                Until False;
                If ans=n then begin res:=mid;r:=mid;end Else l:=mid+1;
        until l>=r;
        If res=0 then writeln(g,'No') Else Writeln(g,res);
        Close(f);Close(g);
END.
