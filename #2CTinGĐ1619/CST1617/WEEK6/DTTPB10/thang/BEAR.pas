Const fi='BEAR.INP';
        fo='BEAR.OUT';
Type list=record
        x,y,ts:Longint;end;
Var a:Array[1..100000] Of list;
        p,t:Array[1..10000] Of Longint;
        n,m,ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:Longint;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do Read(f,p[n]);
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                a[m].x:=u;a[m].y:=v;a[m].ts:=2*ts+p[u]+p[v];
        end;
End;
Procedure sort(h,l:Longint);
Var i,j,x:Longint;
        tg:list;
Begin
        i:=h;j:=l;
        x:=a[(h+l) div 2].ts;
        Repeat
                While a[i].ts<x do inc(i);
                While a[j].ts>x do dec(j);
                If i<=j then
                begin
                        tg:=a[i];a[i]:=a[j];a[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
ENd;
Function union(u,v:Longint):Boolean;
Begin
        While u<>t[u] do u:=t[u];
        While v<>t[v] do v:=t[v];
        If u=v then Exit(False);
        If u<v then t[v]:=u Else t[u]:=v;
        Exit(True);
End;
Procedure Solve;
Var i,d:Longint;
Begin
        sort(1,m);ans:=0;
        d:=0;
        For n:=1 to n do t[n]:=n;
        For i:=1 to m do
                With a[i] do
                        If union(x,y) then
                        begin
                                inc(d);
                                ans:=ans+ts;
                                If d=n-1 then break;
                        end;
        If d<>n-1 then writeln(g,-1) Else writeln(g,ans+p[1]);
End;
BEGIN
        Data;
        Solve;
        CLose(f);CLose(g);
END.