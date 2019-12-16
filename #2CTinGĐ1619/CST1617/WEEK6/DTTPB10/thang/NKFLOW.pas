Uses Math;
Const fi='';
        fo='';
        maxn=1000;
Type list=^node;
        node=Record
                v,c,f:Longint;link:list;end;
Var a:Array[1..maxn] Of list;
        d,q:Array[1..2*maxn] Of Longint;
        kt:Array[1..maxn] Of boolean;
        n,m,s,t:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:Longint;
        tmp:list;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m,s,t);
        For n:=1 to n do a[n]:=nil;
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                new(tmp);
                tmp^.v:=v;tmp^.c:=ts;tmp^.f:=0;tmp^.link:=a[u];a[u]:=tmp;
                new(tmp);
                tmp^.v:=u;tmp^.c:=0;tmp^.f:=0;tmp^.link:=a[v];a[v]:=tmp;
        end;
ENd;
Function bfs:Boolean;
Var first,last,u,v:Longint;
        tmp:list;
Begin
        Fillchar(d,sizeof(d),0);d[s]:=1;
        q[1]:=s;first:=1;last:=1;
        Repeat
                u:=q[first];inc(first);
                tmp:=a[u];
                While tmp<>nil do
                begin
                        v:=tmp^.v;
                        If (d[v]=0)and(tmp^.c>tmp^.f) then
                        begin
                                d[v]:=d[u]+1;
                                inc(last);
                                q[last]:=v;
                        end;
                        tmp:=tmp^.link;
                end;
        Until first>last;
        If d[t]=0 then Exit(False);Exit(True);
End;
Function dfs(u,delta:Longint):Longint;
Var v,tl:Longint;
        tmp,tmp1:list;
Begin
        If u=t then Exit(Delta);
        kt[u]:=False;
        tmp:=a[u];
        WHile tmp<>nil do
        begin
                v:=tmp^.v;
                IF (kt[v])and(d[v]=d[u]+1)and(tmp^.c>tmp^.f) then
                begin
                        tl:=dfs(v,min(tmp^.c-tmp^.f,delta));
                        If tl>0 then
                        begin
                                tmp^.f:=tmp^.f+tl;
                                tmp1:=a[v];
                                While tmp1^.v<>u do tmp1:=tmp1^.link;
                                tmp1^.f:=tmp1^.f-tl;
                                Exit(tl);
                        end;
                end;
                tmp:=tmp^.link;
        end;
        Exit(0);
End;
Procedure Solve;
Var i,ans:Longint;
Begin
        ans:=0;
        While bfs do
        begin
                Fillchar(kt,sizeof(kt),True);
                Repeat
                        i:=dfs(s,maxlongint);
                        ans:=ans+i;
                Until i=0;
        end;
        Writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.