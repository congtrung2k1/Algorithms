Const fi='RANKING1.INP';
        fo='RANKING1.OUT';
        maxn=trunc(1e5);
Var t,a,b,id,fx:Array[0..maxn] Of int64;
        n,m,d:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do begin Read(f,a[n]);id[n]:=n;end;
ENd;
Function swap(Var a,b:int64):int64;
Begin
        swap:=a;a:=b;b:=swap;
ENd;
Procedure Sort(h,l:Longint);
Var i,j:Longint;
        x,tg:int64;
Begin
        i:=h;j:=l;
        x:=a[(h+l) div 2];
        Repeat
                While a[i]<x do inc(i);
                While a[j]>x do dec(j);
                If i<=j then
                begin
                        swap(a[i],a[j]);
                        swap(id[i],id[j]);
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;
Procedure update(x:int64);
Begin
        While x>0 do
        begin
                inc(t[x]);
                x:=x-x and(-x);
        end;
ENd;
Function query(x:int64):int64;
Begin
        query:=0;
        While x<maxn do
        begin
                query:=query+t[x];
                x:=x+x and(-x);
        end;
ENd;
Procedure Solve;
Var i,x:Longint;
Begin
        sort(1,n);
        d:=0;a[0]:=0;
        For i:=1 to n do
                If a[i]=a[i-1] then b[id[i]]:=d
                Else begin inc(d);b[id[i]]:=d;end;
        For i:=1 to n do begin fx[i]:=query(b[i]+1);update(b[i]);end;
        For i:=1 to m do
        begin
                Readln(f,x);Writeln(g,fx[x]+1);
        end;
ENd;
BEGIN
        Data;
        solve;
        Close(f);Close(g);
END.
