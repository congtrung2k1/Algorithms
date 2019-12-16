Const fi='TRONGCAY.INP';
        fo='TRONGCAY.OUT';
        maxn=trunc(5000);
        oo=trunc(1e9);
Var a:Array[1..maxn,1..maxn] Of Longint;
        heap,pos,d,fx:Array[1..maxn] Of Longint;
        kt:Array[1..maxn] Of Boolean;
        sl,pre,s:Array[1..maxn,1..maxn] Of Longint;
        n,m,top,ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:longint;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For u:=1 to n do For v:=1 to n do a[u,v]:=oo;
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                inc(u);inc(v);
                        If ts<a[u,v] then begin a[u,v]:=ts;a[v,u]:=a[u,v];sl[u,v]:=1;sl[v,u]:=1;end
                        Else If ts=a[u,v] then begin inc(sl[u,v]);inc(sl[v,u]);end;
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
                For v:=1 to n do
                        If kt[v] then
                                If d[v]>d[u]+a[u,v] then begin d[v]:=d[u]+a[u,v];fx[v]:=1;pre[v,fx[v]]:=u;push(v,d[v]);end
                                Else If d[v]=d[u]+a[u,v] then begin inc(fx[v]);pre[v,fx[v]]:=u;end;
        Until False;
End;
Procedure find(v:Longint);
Var i:Longint;
Begin
        If v=1 then Exit;
        For i:=1 to fx[v] do
                If sl[v,pre[v,i]]>0 then
                begin
                        ans:=ans+a[v,pre[v,i]]*sl[v,pre[v,i]];
                        sl[v,pre[v,i]]:=0;
                        find(pre[v,i]);
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
