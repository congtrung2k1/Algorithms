USes Math;
Const fi='MECUNG.INP';
        fo='MECUNG.OUT';
        maxn=300;
        td:Array[1..4] Of shortint=(0,0,1,-1);
        tc:Array[1..4] Of shortint=(1,-1,0,0);
Type list=^node;
        node=record
                v:Longint;link:list;end;
Var c:Array[1..maxn,1..maxn] Of char;
        a:Array[1..maxn,1..maxn] Of Longint;
        dd:Array[1..maxn*maxn] Of list;
        d,b:Array[1..maxn*maxn] Of Longint;
        kt:Array[1..maxn*maxn] Of boolean;
        n,m,k,cnt,ans,res:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m,k);
        For n:=1 to n do
        begin
                For m:=1 to m do Read(f,c[n,m]);
                Readln(f);
        end;
End;
Procedure dfs(i,j,u,v:Integer);
Begin
        If (i<1)or(i>n)or(j<1)or(j>m) then Exit;
        If (a[i,j]=0)and(c[u,v]=c[i,j]) then
        begin
                a[i,j]:=cnt;inc(d[cnt]);
                dfs(i-1,j,i,j);dfs(i,j-1,i,j);
                dfs(i+1,j,i,j);dfs(i,j+1,i,j);
        end;
End;
Procedure try(u:Longint);
Var v:Longint;
        tmp:list;
Begin
        kt[u]:=false;tmp:=dd[u];res:=res+d[u];
        While tmp<>nil do
        begin
                v:=tmp^.v;
                If kt[v] then try(v);
                tmp:=tmp^.link;
        end;
End;
Procedure Solve;
Var i,j,u,v,p,i1,j1:Longint;
        tmp:list;
Begin
        cnt:=0;
        Fillchar(a,sizeof(a),0);
        For i:=1 to n do
                For j:=1 to m do
                        If a[i,j]=0 then
                        begin
                                inc(cnt);
                                d[cnt]:=0;
                                dfs(i,j,i,j);
                        end;
        Fillchar(dd,sizeof(dd),False);
        For i:=1 to cnt do dd[i]:=nil;
        For i:=1 to n do
                For j:=1 to m do
                        For p:=1 to 4 do
                        begin
                                i1:=i+td[p];j1:=j+tc[p];
                                If (i1<1)or(i1>n)or(j1<1)or(j1>m) then continue;
                                If a[i1,j1]<>a[i,j] then
                                begin
                                        u:=a[i1,j1];v:=a[i,j] ;
                                tmp:=dd[u];
                                While tmp<>nil do
                                begin
                                        If tmp^.v=v then break;
                                        tmp:=tmp^.link;
                                end;
                                If tmp=nil then
                                begin
                                        new(tmp);
                                        tmp^.v:=v;tmp^.link:=dd[u];dd[u]:=tmp;
                                        new(tmp);
                                        tmp^.v:=u;tmp^.link:=dd[v];dd[v]:=tmp;
                                        inc(b[u]);inc(b[v]);
                                end;
                                end;
                        end;
        ans:=0;
        Fillchar(kt,sizeof(kt),True);
        Repeat
                For u:=1 to cnt+1 do
                        If kt[u]and(b[u]<k) then break;
                If u=cnt+1 then break;
                kt[u]:=False;
                tmp:=dd[u];
                While tmp<>nil do
                begin
                        If kt[tmp^.v] then
                        begin
                        dec(b[tmp^.v]);dec(b[u]);
                        end;
                        tmp:=tmp^.link;
                end;
        Until False;
        For u:=1 to cnt do
        begin
                If kt[u] then begin res:=0;try(u);ans:=max(ans,res);end;
        end;
        writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
