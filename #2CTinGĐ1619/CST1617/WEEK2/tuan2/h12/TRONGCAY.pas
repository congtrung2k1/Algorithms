Const fi='TRONGCAY.INP';
        fo='TRONGCAY.OUT';
        maxn=trunc(1e4);
        oo=trunc(1e9);
Type list=^node;
        node=Record
                v,ts,c:Longint;link:list;end;
Var a:Array[1..maxn] Of list;
        heap,pos,d,fx:Array[1..maxn] Of Longint;
        pre:Array[1..maxn] Of List;
        kt:Array[1..maxn] Of Boolean;
        n,m,top,ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:longint;
        tmp:list;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do a[n]:=nil;
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                inc(u);inc(v);
                tmp:=a[u];
                While tmp<>nil do
                begin
                        If tmp^.v=v then break;
                        tmp:=tmp^.link;
                end;
                If tmp=nil then
                begin
                        new(tmp);
                        tmp^.v:=v;tmp^.ts:=ts;tmp^.c:=1;tmp^.link:=a[u];a[u]:=tmp;
                        new(tmp);
                        tmp^.v:=u;tmp^.ts:=ts;tmp^.c:=1;tmp^.link:=a[v];a[v]:=tmp;
                end
                Else
                begin
                        If ts<tmp^.ts then
                        begin
                                tmp^.ts:=ts;tmp^.c:=1;
                                tmp:=a[v];
                                While tmp^.v<>u do tmp:=tmp^.link;
                                tmp^.ts:=ts;tmp^.c:=1;
                        end
                        Else If ts=tmp^.ts then
                        begin
                                inc(tmp^.c);
                                tmp:=a[v];
                                While tmp^.v<>u do tmp:=tmp^.link;
                                inc(tmp^.c);
                        end;
                end;
        end;
End;
Procedure push(v:Longint;ts:Longint);
Var p,c:Longint;
begin
        c:=pos[v];
        If c=0 then
        begin
                inc(top);c:=top;
        end;
        p:=c div 2;
        While (p>0)and(d[heap[p]]>d[v]) do
        begin
                heap[c]:=heap[p];pos[heap[c]]:=c;c:=p;
                p:=c div 2;
        end;
        heap[c]:=v;pos[v]:=c;
End;
Function pop:Longint;
Var p,c,v:Longint;
Begin
        pop:=heap[1];
        v:=heap[top];
        dec(top);p:=1;
        While 2*p<=top do
        begin
                c:=p*2;
                If(c<top)and(d[heap[c]]>d[heap[c+1]]) then inc(c);
                If d[v]<=d[heap[c]] then break;
                heap[p]:=heap[c];pos[heap[p]]:=p;p:=c;
        end;
        heap[p]:=v;pos[v]:=c;
End;
Procedure djt;
Var u,v:Longint;
        tmp,tmp1:list;
Begin
        Fillchar(pos,sizeof(pos),0);
        Fillchar(heap,sizeof(heap),0);
        Fillchar(kt,sizeof(kt),True);
        top:=0;
        push(1,0);
        Repeat
                If top=0 then break;
                u:=pop;
                kt[u]:=False;
                tmp:=a[u];
                While tmp<>nil do
                begin
                        v:=tmp^.v;
                        If kt[v] then
                                If d[v]>d[u]+tmp^.ts then
                                begin
                                        d[v]:=d[u]+tmp^.ts;push(v,d[v]);
                                        pre[v]:=nil;
                                        new(tmp1);
                                        tmp1^.v:=u;;tmp1^.ts:=tmp^.ts;tmp1^.c:=tmp^.c;tmp1^.link:=pre[v];pre[v]:=tmp1;
                                end
                                Else If d[v]=d[u]+tmp^.ts then
                                begin
                                        //inc(fx[v]);
                                        new(tmp1);
                                        tmp1^.v:=u;;tmp1^.ts:=tmp^.ts;tmp1^.c:=tmp^.c;tmp1^.link:=pre[v];pre[v]:=tmp1;
                                end;
                        tmp:=tmp^.link;
                end;
        Until False;
End;
Procedure find(v:Longint);
Var i:Longint;
        tmp:list;
Begin
        tmp:=pre[v];
        While tmp<>nil do
        begin
                If tmp^.c>0 then
                begin
                        ans:=ans+tmp^.c*tmp^.ts;
                        tmp^.c:=0;
                        find(tmp^.v);
                end;
                tmp:=tmp^.link;
        end;
ENd;
Procedure Solve;
Var i:Longint;
Begin
        Fillchar(fx,sizeof(fx),0);
        For i:=1 to n do d[i]:=oo;d[1]:=0;fx[1]:=0;
        djt;
        find(n);
        Writeln(g,ans*2);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
