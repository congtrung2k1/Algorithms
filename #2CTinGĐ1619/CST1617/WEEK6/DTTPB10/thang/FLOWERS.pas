Const fi='FLOWERS.INP';
        fo='FLOWERS.OUT';
        maxn=trunc(1e6);
Var a,id,b:Array[1..maxn] Of Longint;
        m,n,s,vt,ans,d,c:Longint;
        f,g:Text;
Procedure sort(h,l:Longint);
Var i,j,x,tg:longint;
Begin
        i:=h;j:=l;
        x:=b[id[(h+l) div 2]];
        Repeat
                While b[id[i]]<x do inc(i);
                While b[id[j]]>x do dec(j);
                If (i<=j) then
                begin
                        tg:=id[i];id[i]:=id[j];id[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
ENd;
Function find(x:Longint):longint;
Var l,r,mid:Longint;
Begin
        l:=1;r:=m;
        Repeat
                mid:=(r+l) div 2;
                If b[id[mid]]+x>s then r:=mid-1 Else l:=mid;
        Until l+1>=r;
        If b[id[r]]+x<=s then exit (id[r]);
        If b[id[l]]+x<=s then exit(id[l]);
        exit(0);
End;
BEGIN
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m,s);
        For n:=1 to n do Read(f,a[n]);
        Readln(f);
        For m:=1 to m do begin read(f,b[m]);id[m]:=m;end;
        sort(1,m);
        c:=0;d:=0;
        ans:=0;
        For n:=1 to n do
        begin
                vt:=find(a[n]);
                If vt<>0 then
                        If b[vt]+a[n]>ans then begin d:=n;c:=vt;ans:=b[vt]+a[n];end;
        end;
        Writeln(g,d,#32,c);
        Close(f);Close(g);
END.
