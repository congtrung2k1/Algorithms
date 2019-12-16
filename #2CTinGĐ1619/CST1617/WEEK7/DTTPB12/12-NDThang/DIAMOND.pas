Const fi='DIAMOND.INP';
        fo='DIAMOND.OUT';
        maxn=50;maxm=200;
Var a,b:Array[1..maxm] Of Integer;
        c,s,ss:Array[1..maxn] Of Integer;
        x,z:Array[0..maxm,0..maxn,0..100] Of int64;
        n,m,la,lb,i:Integer;
        tt,ans:int64;
        f,g:Text;
Procedure Data;
Var i:Byte;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,m);Readln(f,n);
        For i:=1 to n do Readln(f,c[i],s[i]);
        Readln(f,tt);
        lb:=0;
        While not seekeoln(f) do
        begin
                inc(lb);Read(f,b[lb]);
        end;
End;
Procedure Init(m,n:Byte);
Var i,j,l,k,h:Byte;
Begin
        Fillchar(x,sizeof(x),0);
        For i:=2 to m do
                For j:=n downto 1 do
                        If i>=c[j] then
                                For l:=1 to s[j] do
                                begin
                                        If i<l*c[j] then break;
                                        If i=l*c[j] then x[i,j,l]:=1 Else
                                        begin
                                                x[i,j,l]:=0;
                                                For k:=j+1 to n do
                                                        For h:=1 to s[k] do
                                                        begin
                                                                If i-l*c[j]<h*c[k] then break;
                                                                x[i,j,l]:=x[i,j,l]+x[i-l*c[j],k,h];
                                                        end;
                                        end;
                                end;
        Fillchar(z,sizeof(z),0);
        For i:=2 to m do
                For j:=1 to n do
                        For l:=1 to s[j] do
                                For k:=1 to l do z[i,j,l]:=z[i,j,l]+x[i,j,k];
End;
Procedure many;
Var j,l:Byte;
Begin
        ans:=0;
        For j:=1 to n do For l:=1 to s[j] do ans:=ans+x[m,j,l];
End;
Procedure what;
Var i,j,t:Byte;
Begin
        ss:=s;
        t:=0;i:=m;j:=1;
        Repeat
                While tt>z[i,j,ss[j]] do
                begin
                        tt:=tt-z[i,j,ss[j]];inc(j);
                end;
                inc(t);a[t]:=c[j];
                If tt=0 then break;
                i:=i-a[t];
                dec(ss[j]);
        Until i=0;
        la:=t;
End;
Procedure where;
Var i,j,t:Byte;
Begin
        ss:=s;tt:=1;i:=m;j:=1;
        For t:=1 to lb do
        begin
                While c[j]<b[t] do
                begin
                        tt:=tt+z[i,j,ss[j]];inc(j);
                end;
                i:=i-b[t];dec(ss[j]);
        end;
End;
BEGIN
        Data;
        Init(m,n);
        many;
        Writeln(g,ans);
        what;
        For i:=1 to la do write(g,a[i],#32);Writeln(g);
        where;
        Writeln(g,tt);
        Close(f);Close(g);
END.