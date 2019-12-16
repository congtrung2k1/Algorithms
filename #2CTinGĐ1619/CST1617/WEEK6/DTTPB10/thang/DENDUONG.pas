Const fi='DENDUONG.INP';
        fo='DENDUONG.OUT';
Var a:Array[1..100000] Of Longint;
        n,s:Longint;
        l,r,m:extended;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,s);
        For n:=1 to n do Read(f,a[n]);
End;
Procedure sort(h,l:Longint);
Var i,j,x,tg:longint;
Begin
        i:=h;j:=l;
        x:=a[(h+l) div 2];
        Repeat
                While a[i]<x do inc(i);
                While a[j]>x do dec(j);
                If (i<=j) then
                begin
                        tg:=a[i];a[i]:=a[j];a[j]:=tg;
                        inc(i);dec(j);
                end;
        Until i>j;
        If i<l then sort(i,l);
        If h<j then sort(h,j);
ENd;
Function check(x:extended):Boolean;
Var i:Longint;
        tmp:extended;
Begin
        tmp:=0;
        i:=1;
        While i<=n do
        begin
                If tmp<=a[i] then
                begin
                        tmp:=tmp+x;
                        If tmp<a[i] then exit(false)

                end
                Else tmp:=a[i]+x;
                inc(i);
        end;
        If s<=tmp then exit(True) Else Exit(False);
ENd;
Procedure Solve;
BEgin
        l:=0;r:=s;
        m:=(l+r)/2;
        Repeat
                If check(m) then r:=m else l:=m;
                m:=(l+r)/2;
        Until (m=l)or(m=r);
        If check(l) then Writeln(g,l:0:2)
        Else If check(r) then writeln(g,r:0:2);
ENd;
BEGIN
        Data;
        sort(1,n);
        solve;
        CLose(f);Close(g);
END.
