Const fi='';
        fo='';
        maxn=4000;
Var a,b,c,d:Array[1..maxn] Of Longint;
        s,r:Array[1..maxn*maxn] Of Longint;
        n,m,p:Longint;
        ans:int64;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n);
        For n:=1 to n do
        begin
                Readln(f,a[n],b[n],c[n],d[n]);
        end;
ENd;
Procedure Sort(h,l:Longint);
Var i,j,tg,x:Longint;
Begin
        i:=h;j:=l;
        x:=s[(h+l) div 2];
        Repeat
                While s[i]<x do inc(i);
                While s[j]>x do dec(j);
                If i<=j then
                begin
                        tg:=s[i];s[i]:=s[j];s[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
End;
Procedure Sort_r(h,l:Longint);
Var i,j,tg,x:Longint;
Begin
        i:=h;j:=l;
        x:=r[(h+l) div 2];
        Repeat
                While r[i]<x do inc(i);
                While r[j]>x do dec(j);
                If i<=j then
                begin
                        tg:=r[i];r[i]:=r[j];r[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort_r(i,l);
        If h<j then sort_r(h,j);
End;
Function tknp(x:Longint):int64;
Var l,h,mid,r1,l1:Longint;
Begin
        l:=1;h:=p;
        Repeat
                mid:=(l+h) div 2;
                IF r[mid]<x then l:=mid+1 Else h:=mid;
        Until l>=h;
        l1:=0;
        If r[l]=x then l1:=l
        Else if r[h]=x then l1:=h;
        l:=1;h:=p;
        Repeat
                mid:=(l+h) div 2;
                If r[mid]>x then h:=mid-1 Else l:=mid;
        Until l+1>=h;
        r1:=0;
        If r[h]=x then r1:=h
        Else If r[l]=x then r1:=l;
        If l1=0 then Exit(0);
        Exit(r1-l1+1);
End;
Procedure Solve;
Var i,j:Longint;
        l:int64;
Begin
        m:=0;
        For i:=1 to n do
                For j:=1 to n do
                begin
                        inc(m);
                        s[m]:=a[i]+b[j];
                end;
        sort(1,m);
        p:=0;
        For i:=1 to n do
                For j:=1 to n do
                begin
                        inc(p);
                        r[p]:=(c[i]+d[j])*(-1);
                end;
        sort_r(1,p);
        i:=1;
        While i<=m do
        begin
                j:=i;
                While (j<=m)and(s[i]=s[j]) do inc(j);
                l:=tknp(s[i]);
                ans:=ans+l*int64(j-i);
                i:=j;
        end;
        Writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
