Uses Math;
Const fi='TRANSPO.INP';
        fo='TRANSPO.OUT';
        maxn=5*trunc(1e4);
        oo=trunc(1e9);
Type list=^node;
        node=record
                v,ts:Longint;link:list;end;
Var a:Array[1..maxn] Of list;
        heap,pos,d:Array[1..maxn] Of Longint;
        kt:Array[1..maxn] Of Boolean;
        n,m,top,maxe,ans:Longint;
        f,g:Text;
Procedure Data;
Var u,v,ts:Longint;
        tmp:list;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        maxe:=0;
        For n:=1 to n do a[n]:=nil;
        For m:=1 to m do
        begin
                Readln(f,u,v,ts);
                tmp:=a[u];
                While tmp<>nil do
                begin
                        If tmp^.v=v then break;tmp:=tmp^.link;
                end;
                If tmp=nil then
                begin
                        maxe:=max(maxe,ts);
                        new(tmp);
                        tmp^.v:=v;tmp^.ts:=ts;tmp^.link:=a[u];a[u]:=tmp;
                        new(tmp);
                        tmp^.v:=u;tmp^.ts:=ts;tmp^.link:=a[v];a[v]:=tmp;
                end
                Else
                begin
                        If ts>tmp^.ts then
                        begin
                                maxe:=max(maxe,ts);
                                tmp^.ts:=ts;
                                tmp:=a[v];
                                While tmp<>nil do
                                begin
                                        If tmp^.v=u then break;tmp:=tmp^.link;
                                end;
                                tmp^.ts:=ts;
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
Function djt(x:Longint):Boolean;
Var u,v:Longint;
        tmp:list;
Begin
        push(1,0);
        Repeat
                u:=pop;
                kt[u]:=False;
                tmp:=a[u];
                While tmp<>nil do
                begin
                        If kt[tmp^.v]and(d[tmp^.v]>d[u]+1)and(tmp^.ts>=x) then begin d[tmp^.v]:=d[u]+1;push(tmp^.v,d[tmp^.v]);end;
                        tmp:=tmp^.link;
                end;
        Until top=0;
End;
Function check(x:Longint):Boolean;
Var i:Longint;
Begin
        Fillchar(kt,sizeof(kt),True);
        Fillchar(heap,sizeof(heap),0);
        FIllchar(pos,sizeof(pos),0);
        top:=0;
        For i:=1 to n do d[i]:=oo;
        d[1]:=0;
        djt(x);
        If d[n]=oo then Exit(False) else Exit(true);
End;
Procedure Solve;
Var l,r,mid:Longint;
Begin
        l:=1;r:=maxe;
        Repeat
                mid:=(l+r) div 2;
                If check(mid) then begin ans:=mid;l:=mid+1;end Else r:=mid-1;
        Until l>r;
        writeln(g,ans);
ENd;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.
