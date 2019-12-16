Uses Math;
Const fi='SEQ198.INP';
        fo='SEQ198.out';
var a,cs,b,kq,c:Array[1..2000] Of Longint;
        bit:Array[1..20] Of Byte;
        m,cnt,ans:Longint;
        f,g:text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,m);
        For m:=1 to m do
        begin
                Read(f,a[m]);
                cs[m]:=m;
        end;
ENd;
procedure Sort(l,r:longint);
var i,j,k,temp,csk:longint;
begin
        i:=l;
        j:=r;
        k:=random(r-l+1)+l;
        csk:=k;
        k:=a[k];
        repeat
                while (a[i]<k) or ((a[i]=k) and (cs[i]<cs[k])) do inc(i);
                while (a[j]>k) or ((a[j]=k) and (cs[j]>cs[k])) do dec(j);
                if i<=j then
                begin
                        temp:=a[i];
                        a[i]:=a[j];
                        a[j]:=temp;
                        temp:=cs[i];
                        cs[i]:=cs[j];
                        cs[j]:=temp;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
Function check:boolean;
Var i,j:Integer;
        kt:Boolean;
Begin
        //kt:=true;
        For i:=1 to m do
                For j:=i+1 to m do
                        If(bit[i]=0)and(bit[j]=0) then
                                If (abs(a[i]-a[j])=1)or(abs(a[i]-a[j])=8)or(abs(a[i]-a[j])=9) then Exit(False);
        Exit(True);
End;
Procedure task1(x:Integer);
Var i:Integer;
Begin
        If x>m then Exit;
        For i:=0 to 1 do
        begin
                bit[x]:=i;
                If i=1 then inc(cnt);
                If x=m then
                        If check then ans:=min(ans,cnt);
                task1(x+1);
                If i=1 then dec(cnt);
        end;
End;
procedure Process;
var i,x,n,d,j,l:longint;
begin
        i:=2;
        x:=a[1];
        n:=1;
        b[1]:=a[1];
        d:=1;
        while i<=m do
        begin
                if a[i]=x then inc(d)
                else
                begin
                        c[n]:=d;
                        x:=a[i];
                        inc(n);
                        d:=1;
                        b[n]:=a[i];
                end;
                inc(i);
        end;
        kq[1]:=0;
        l:=maxlongint;
        for i:=1 to n do
        begin
                for j:=i-1 downto i-10 do
                begin
                        if (b[i]-b[j]=1) or (b[i]-b[j]=8) or (b[i]-b[j]=9) then
                        begin
                                if kq[i]>kq[j]+c[i] then
                                begin
                                        kq[i]:=kq[j]+c[i];
                                end;
                        end;
                end;
        end;

end;
BEGIN
        Data;
        ans:=maxlongint;
        If m<=20 then
        begin
                cnt:=0;
                task1(1);
                Writeln(g,ans);
        end
        else
        begin
                Sort(1,m);
                Process;
        end;
        Close(f);CLose(g);
END.