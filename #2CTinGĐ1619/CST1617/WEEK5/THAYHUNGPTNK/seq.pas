Uses Math;
Const fi='SEQ.INP';
        fo='SEQ.OUT';
        maxn=trunc(1e5);
Var a,id,c:Array[1..maxn] Of int64;
        kt,d:Array[1..maxn] Of Longint;
        n,m,cnt,ans:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For n:=1 to n do begin Read(f,a[n]);id[n]:=n;end;
End;
Procedure Sort(h,l:Longint);
Var i,j:Longint;
        x,tg:Longint;
Begin
        i:=h;j:=l;
        x:=a[id[(l+h) div 2]];
        Repeat
                While a[id[i]]<x do inc(i);
                While a[id[j]]>x do dec(j);
                If i<=j then
                begin
                        tg:=id[i];id[i]:=id[j];id[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;
Procedure Solve;
Var i,sum,j:Longint;
Begin
        sort(1,n);
        cnt:=1;c[id[1]]:=1;i:=2;
        While i<=n do
        begin
                If a[id[i]]=a[id[i-1]] then c[id[i]]:=cnt
                Else begin inc(cnt);c[id[i]]:=cnt;end;
                inc(i);
        end;
        Fillchar(kt,sizeof(kt),0);
        For i:=1 to n do inc(kt[c[i]]);
        d:=kt;
        j:=1;ans:=0;sum:=0;
        For i:=1 to n do
        begin
                If kt[c[i]]=d[c[i]] then sum:=sum+1;
                dec(kt[c[i]]);
                If sum>m then
                begin
                        While sum>m do begin inc(kt[c[j]]);If kt[c[j]]=d[c[j]] then sum:=sum-1;inc(j);end;
                        ans:=max(ans,(i-j+1));
                end;
                ans:=max(ans,(i-j+1));
        end;
        Writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
