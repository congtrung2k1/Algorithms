Uses math;
Const fi='JUMP.INP';
        fo='JUMP.OUT';
        maxn=1000;
        oo=trunc(1e9);
type td=record x,s,b:Longint;end;
Var dd:Array[1..maxn,1..maxn] Of Boolean;
        q:Array[1..2*maxn] Of td;
        a:Array[1..maxn] Of Longint;
        n,ans:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n);
        For n:=1 to n do Read(f,a[n]);
End;
Procedure Solve;
Var first,last,u,v,k:Longint;
Begin
        q[1].x:=1;q[1].s:=0;q[1].b:=0;
        first:=1;last:=1;ans:=oo;
        Fillchar(dd,sizeof(dd),True);
        Repeat
                u:=q[first].x;v:=q[first].s;k:=q[first].b;inc(first);
                If(u+k+1<=n) then
                begin
                        //If dd[u,u+k+1] then
                        begin
                                dd[u,u+k+1]:=False;
                                inc(last);
                                q[last].x:=u+k+1;q[last].s:=v+a[u+k+1];q[last].b:=k+1;
                                If u+k+1=n then ans:=min(ans,q[last].s);
                        end;
                end;
                If(u-k>=1)and(k<>0) then
                begin
                        //If dd[u,u-k] then
                        begin
                                dd[u,u-k]:=False;
                                inc(last);
                                q[last].x:=u-k;q[last].s:=v+a[u-k];q[last].b:=k;
                        end;
                end;
        Until first>last;
        If ans=oo then writeln(g,0) Else
        writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);CLose(g);
END.
