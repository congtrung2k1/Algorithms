Uses Math;
Const fi='ALADDIN.INP';
        fo='ALADDIN.OUT';
Var n,m:Integer;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
ENd;
Function add(a,b:ansistring):ansistring;
Var nho:byte;
        i:Longint;
Begin
        While (length(b)>length(a)) do a:='0'+a;
        While (length(a)>length(b)) do b:='0'+b;
        nho:=0;
        add:='';
        For i:=length(a) downto 1 do
        begin
                nho:=ord(a[i])+ord(b[i])-96+nho;
                add:=chr(nho mod 10+48)+add;
                nho:=nho div 10;
        end;
        If nho=1 then add:='1'+add;
End;
Function tru(x,y:ansistring):ansistring;
Var nho:byte;
        i:Longint;
Begin
        While length(x)>length(y) do y:='0'+y;
        nho:=0;
        For i:=length(x) downto 1 do
        begin
                nho:=10+ord(x[i])-ord(y[i])-nho;
                x[i]:=chr(48+(nho mod 10));
                nho:=1-nho div 10;
        end;
        While (x[1]='0')and(length(x)>1) do delete(x,1,1);
        Exit(x);
End;
Function nhan(x,y:ansistring):ansistring;
Var z:ansistring;
        tmp,k,i:longint;
Begin
        z:=x+y;tmp:=0;
        For k:=length(z) downto 1 do
        begin
                For i:=max(1,k-length(y)) to min(k-1,length(x)) do
                tmp:=tmp+(ord(x[i])-48)*(ord(y[k-i])-48);
                z[k]:=chr(48+tmp mod 10);
                tmp:=tmp div 10;
        end;
        If tmp>0 then z[k]:=chr(tmp+48);
        While (z[1]='0')and(length(z)>1) do delete(z,1,1);
        exit(z);
End;
Function power(p:longint):ansistring;
Var tmp:ansistring;
Begin
        If p=1 then exit('2');
        tmp:=power(p div 2);
        tmp:=nhan(tmp,tmp);
        If p mod 2=1 then tmp:=nhan(tmp,'2');
        Exit(tmp);
End;
Procedure solve;
Var s1,s2:ansistring;
Begin
        s1:=power(m);
        s2:=power(n);
        writeln(g,tru(add(s1,s2),'2'))
End;
BEGIN
        Data;
        Solve;
        CLose(f);Close(g);
END.
