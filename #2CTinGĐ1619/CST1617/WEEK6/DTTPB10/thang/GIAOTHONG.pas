Uses math;
Const fi='GIAOTHONG.INP';
        fo='GIAOTHONG.OUT';
        maxn=10000;
Type list=^node;
        node=Record
                v:Longint;k:Boolean;link:list;end;
        canh=Record
                u,v:Longint;end;
Var a:Array[1..maxn] Of List;
        num,low:Array[1..maxn] Of Longint;
        kt:Array[1..maxn] Of boolean;
        stack:Array[1..maxn] Of canh;
        n,m,count,top,ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v:Longint;
        tmp:list;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do a[n]:=nil;
        For m:=1 to m do
        begin
                Readln(f,u,v);
                new(tmp);
                tmp^.v:=v;tmp^.k:=True;tmp^.link:=a[u];a[u]:=tmp;
                new(tmp);
                tmp^.v:=u;tmp^.k:=true;tmp^.link:=a[v];a[v]:=tmp;
        end;
End;
Procedure Init;
Begin
        Fillchar(num,sizeof(num),0);
        Fillchar(kt,sizeof(kt),True);
        top:=0;count:=0;
End;
Procedure push(u,v:Longint);
Begin
        inc(top);
        stack[top].u:=u;stack[top].v:=v;
End;
Function pop:canh;
Begin
        pop.u:=stack[top].u;pop.v:=stack[top].v;
        dec(top);
End;
Procedure dfs(u,i:Longint);
Var v,cnt:Longint;
        lay:canh;
        tmp,tmp1:list;
Begin
        inc(count);num[u]:=count;low[u]:=num[u];
        push(i,u);
        tmp:=a[u];
        While tmp<>nil do
        begin
                v:=tmp^.v;
                If (kt[v])and(tmp^.k) then
                begin
                        tmp1:=a[v];
                        While tmp1^.v<>u do tmp1:=tmp1^.link;
                        tmp1^.k:=False;
                        If num[v]<>0 then
                        begin
                                low[u]:=min(low[u],num[v]);
                                //push(u,v);
                        end
                        Else
                        begin
                                //push(u,v);
                                dfs(v,u);
                                low[u]:=min(low[u],low[v]);
                                If num[u]<=low[v] then
                                begin
                                        cnt:=0;
                                        Repeat
                                                lay:=pop;
                                                inc(cnt);
                                                kt[lay.v]:=false;
                                        Until (lay.u=u)and(lay.v=v);
                                        ans:=max(ans,cnt+1);
                                end;
                        end;
                end;
                tmp:=tmp^.link;
        end;
        {If num[u]=low[u] then
        begin
                cnt:=0;
                Repeat
                        lay:=pop;
                        inc(cnt);
                        kt[lay.v]:=false;
                Until lay.u=v;
                ans:=max(ans,cnt);
        end; }
End;
Procedure Solve;
Var u:Longint;
Begin
        ans:=0;
        For u:=1 to n do
                If num[u]=0 then dfs(u,u);
        Writeln(g,ans);
End;
BEGIN
        Data;
        Init;
        Solve;
        Close(f);CLose(g);
END.
