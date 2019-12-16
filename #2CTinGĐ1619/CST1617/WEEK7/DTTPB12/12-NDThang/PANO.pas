Uses Math;
Const fi='PANO.INP';
        fo='PANO.OUT';
        maxn=2*trunc(1e4);
Var m,n,top:Longint;
        l,s,c:Array[0..maxn] Of Longint;
        fx:Array[0..100,0..maxn] Of Longint;
        stack:Array[1..maxn] Of record val,pos:Longint;end;
        id,ids:Array[0..maxn] Of longint;
        pp,pi:Array[0..maxn] Of Longint;
        v1,v2:Array[0..maxn] Of Longint;
        q:Array[0..maxn] Of Boolean;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        For m:=1 to m do begin Readln(f,l[m],c[m],s[m]);id[m]:=m;end;
End;
Procedure push(value,posi:Longint);
Begin
        inc(top);
        stack[top].val:=value;
        stack[top].pos:=posi;
        If top=1 then ids[top]:=top
        ELse If stack[top].val>=stack[ids[top-1]].val then ids[top]:=top
        Else ids[top]:=ids[top-1];
End;
Procedure pop(var value,posi:Longint);
Begin
        value:=stack[ids[top]].val;posi:=stack[ids[top]].pos;
End;
Function swap(Var a,b:Longint):Longint;
Begin
        swap:=a;a:=b;b:=swap;
End;
Procedure sort;
Var i,j,k:Longint;
Begin
        For i:=1 to m-1 do
        begin
                k:=i;
                For j:=i+1 to m do
                        If s[j]<s[k] then k:=j;
                swap(l[i],l[k]);swap(c[i],c[k]);swap(s[i],s[k]);swap(id[i],id[k]);
        end;
ENd;
Procedure Solve;
Var i,j,k:Integer;
        value,posi:Longint;
Begin
        sort;
        Fillchar(fx,sizeof(fx),0);
        Fillchar(pp,sizeof(pp),0);
        Fillchar(pi,sizeof(pi),0);
        For i:=1 to m do
        begin
                fx[i]:=fx[i-1];
                top:=0;
                For j:=s[i]-1 downto max(0,s[i]-l[i]) do push(fx[i-1,j]+c[i]*(s[i]-j-1),j);
                For j:=s[i] to min(n,s[i]+l[i]-1) do
                begin
                        pop(value,posi);
                        If fx[i,j]<value+(j-s[i]+1)*c[i] then
                        begin
                                fx[i,j]:=value+(j-s[i]+1)*c[i];
                                pp[j]:=posi+1;
                                pi[j]:=i;
                                If stack[top].pos+l[i]=j then dec(top);
                        end;
                end;
                For j:=s[i]+l[i] to n do
                        If fx[i,j]<fx[i,j-1] then
                        begin
                                fx[i,j]:=fx[i,j-1];
                                pp[j]:=pp[j-1];pi[j]:=pi[j-1];
                        end;
        end;
        Writeln(g,fx[m,n]);

End;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.