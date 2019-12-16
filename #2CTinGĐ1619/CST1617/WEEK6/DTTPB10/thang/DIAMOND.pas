Uses Math;
Const fi='DIAMOND.INP';
        fo='DIAMOND.OUT';
        maxn=trunc(1e5)+1;
Var t,k,heap:Array[1..maxn] Of Longint;
        n,a,b,top:Longint;
        f,g:Text;
Procedure Data;
Var u,v,d:Longint;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,a,b);d:=0;
        For n:=1 to n do
        begin
                Readln(f,u,v);
                If u>b then continue;
                inc(d);t[d]:=u;k[d]:=v;
        end;
        n:=d;
ENd;
Procedure sort(h,l:Longint);
Var x,i,j,tg:Longint;
Begin
        i:=h;j:=l;
        x:=t[random(l-h+1)+h];
        //x:=(l+h)div 2;
        Repeat
                While t[i]<x do inc(i);
                While t[j]>x do dec(j);
                If i<=j then
                begin
                        tg:=t[i];t[i]:=t[j];t[j]:=tg;
                        tg:=k[i];k[i]:=k[j];k[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
ENd;
Procedure push(x:Longint);
Var p,c:Longint;
Begin
        inc(top);heap[top]:=x;
        c:=top;
        While c>1 do
        begin
                p:=c div 2;
                If heap[p]>=x then break;
                heap[c]:=heap[p];c:=p;
        end;
        heap[c]:=x;
End;
Function pop:Longint;
Var p,c,tmp:Longint;
Begin
        pop:=heap[1];heap[1]:=heap[top];tmp:=heap[top];dec(top);
        p:=1;
        While p*2<=top do
        begin
                c:=p*2;
                If (c<top)and(heap[c]<heap[c+1]) then inc(c);
                If tmp>=heap[c] then break;
                heap[p]:=heap[c];p:=c;
        end;
        heap[p]:=tmp;
End;
Procedure Solve;
Var i,time,j,p,u:Longint;
	ans:Int64;
Begin
        randomize;
        sort(1,n);ans:=0;
        top:=0;i:=1;time:=0;t[n+1]:=b;
        Repeat
                time:=t[i];
                While time=t[i] do
                begin
                        push(k[i]);
                        inc(i);
                end;
                time:=t[i]-max(time,a);
                time:=min(top,time);
                For j:=1 to time do
                begin
                        u:=pop;
                        ans:=ans+int64(u);
                end;
        Until i>n;
        Writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        CLose(f);Close(g);
END.
