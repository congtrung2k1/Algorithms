Const fi='blackbox.inp';
        fo='blackbox.out';
        maxn=30000;
Var heap1,a,u,heap2:Array[1..maxn] Of Longint;
        n,m,top1,top2:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do Read(f,a[n]);Readln(f);
        For m:=1 to m do Read(f,u[m]);
End;
Procedure push1(v:Longint);
Var p,c:Longint;
Begin
        inc(top1);heap1[top1]:=v;
        c:=top1;
        While c>1 do
        begin
                p:=c div 2;
                If heap1[p]>=v then break;
                heap1[c]:=heap1[p];c:=p;
        end;
        heap1[c]:=v;
End;
Function replace1(v:Longint):Longint;
Var p,c,tmp:Longint;
Begin
        heap1[1]:=v;tmp:=heap1[1];
        p:=1;
        While p*2<=top1 do
        begin
                c:=p*2;
                IF(c<top1)and(heap1[c+1]>heap1[c]) then break;
                If tmp>=heap1[c] then break;
                heap1[p]:=heap1[c];p:=c;
        end;
        heap1[p]:=tmp;
End;
Procedure push2(v:Longint);
Var p,c:Longint;
Begin
        inc(top2);heap2[top2]:=v;
        c:=top2;
        While c>1 do
        begin
                p:=c div 2;
                If heap2[p]<=v then break;
                heap2[c]:=heap2[p];c:=p;
        end;
        heap2[c]:=v;
End;
Function pop2:Longint;
Var p,c,tmp:Longint;
Begin
        pop2:=heap2[1];
        heap2[1]:=heap2[top2];tmp:=heap2[1];
        dec(top2);
        p:=1;
        While p*2<=top2 do
        begin
                c:=p*2;
                IF(c<top2)and(heap2[c+1]<heap2[c]) then break;
                If tmp<=heap2[c] then break;
                heap2[p]:=heap2[c];p:=c;
        end;
        heap2[p]:=tmp;
End;
Procedure Solve;
Var i,j,cur,tmp,lim:Longint;
Begin
        top1:=0;top2:=0;lim:=1;cur:=1;
        For i:=1 to m do
        begin
                For j:=cur to u[i] do
                begin
                        If top1<lim then push1(a[j])
                        Else
                        If (a[j]>=heap1[1]) then push2(a[j])
                        Else
                        begin
                                tmp:=heap1[1];
                                push2(tmp);
                                replace1(a[j]);
                        end;
                end;
                Writeln(g,heap1[1]);
                inc(lim);
                If top2>0 then
                begin
                        tmp:=pop2;
                        push1(tmp);
                end;
                cur:=u[i]+1;
        end;
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
