Uses Math;
Const fi='DT.INP';
        fo='DT.OUT';
Var a,b,c,t:Array[1..500000] Of Longint;
        n,ans,tg,test,x:Longint;
        f,g:Text;
Procedure Sort(h,l:Longint);
Var i,j,x,tg:Longint;
Begin
        i:=h;j:=l;
        x:=a[(h+l) div 2];
        Repeat
                While (a[i]<x) do inc(i);
                While a[j]>x do dec(j);
                If i<=j then
                begin
                        tg:=a[i];a[i]:=a[j];a[j]:=tg;
                        tg:=b[i];b[i]:=b[j];b[j]:=tg;
                        tg:=c[i];c[i]:=c[j];c[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;
Procedure update(x,v:Longint);
Begin
        While x<=n do
        begin
                t[x]:=min(t[x],v);
                x:=x+(x and(-x));
        end;
End;
Function query(x:Longint):Longint;
Begin
        query:=n+1;
        While x>0 do
        begin
                query:=min(query,t[x]);
                x:=x-(x and(-x));
        end;
End;
Procedure Solve;
Var i:Longint;
Begin
        For i:=1 to n do t[i]:=n+1;
        //For i:=1 to n do update(c[i],b[i]);
        ans:=0;
        For i:=1 to n do
        begin
                tg:=query(c[i]);
                If tg>b[i] then inc(ans);
                Update(c[i],b[i]);
        end;
        Writeln(g,ans);
End;
BEGIN
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
                Readln(f,n);
                For n:=1 to n do begin Read(f,x);a[x]:=n;end;
                For n:=1 to n do begin Read(f,x);b[x]:=n;end;
                For n:=1 to n do begin Read(f,x);c[x]:=n;end;
                Sort(1,n);
                Solve;
        Close(f);Close(g);
END.
