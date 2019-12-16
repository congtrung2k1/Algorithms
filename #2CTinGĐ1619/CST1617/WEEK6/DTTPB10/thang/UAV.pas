Uses Math;
Const fi='UAV.INP';
        fo='UAV.OUT';
        maxn=trunc(1e6);
        oo=trunc(1e15);
Var a,fx,p:Array[1..maxn] Of int64;
        n,l,ans1:Longint;
        ans2:Int64;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,l);Readln(f,n);
        For n:=2 to n-1 do Read(f,a[n]);
        inc(n);a[1]:=1000;a[n]:=1001;
End;
Procedure sol1;
Var i,tmp,j:Longint;
Begin
        tmp:=0;
        For i:=1 to n do
                If odd(a[i]) then begin tmp:=i;p[i]:=i;end Else p[i]:=tmp;
        ans1:=1;p[1]:=1;p[n]:=n;i:=p[1];
        Repeat
                i:=p[min(i+l,n)];
                inc(ans1);
                If i=n then break;
        Until False;
        Writeln(g,ans1);
End;
Procedure Sol2;
Var i:Longint;
Begin
        Fillchar(fx,sizeof(fx),0);
        dec(a[n]);fx[n]:=a[n];ans2:=fx[n];
        For i:=n-1 downto n-l+1 do
                If odd(a[i]) then fx[i]:=-oo Else fx[i]:=fx[n]-a[i];
        For i:=n-l downto 1 do
        begin
                If odd(a[i]) then fx[i]:=-oo
                Else If odd(a[i+l]) then fx[i]:=ans2-a[i]
                Else fx[i]:=max(ans2-a[i],fx[i+l]+a[i]);
                ans2:=max(ans2,fx[i]);
        end;
        Writeln(g,fx[1]+1);
End;
BEGIN
        Data;
        Sol1;
        Sol2;
        Close(f);CLose(g);
END.