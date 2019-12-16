Const fi='RANK.INP';
        fo='RANK.OUT';
Type   index=1..1000;
Var kek:Array[index,index] Of Boolean;
        ke:Array[index,index] Of Integer;
        kt:Array[index] Of Boolean;
        a,l:Array[index] Of longint;
        n,m,k,i,j:Integer;
        kq:Longint;
        f,g:Text;
Procedure Data;
Var u,v:INteger;
Begin
        Assign(f,fi);REset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,n,m);
        Fillchar(ke,sizeof(ke),False);
        For m:=1 to m do
        begin
                Readln(f,u,v);inc(l[u]);ke[u,l[u]]:=v;
        end;
End;
Procedure dfs(u:Integer);
Var v,i:Integer;
Begin
        kt[u]:=False;
        For i:=1 to l[u] do
        begin
                v:=ke[u,i];
                If (kt[v]) then
                begin
                        kek[u,v]:=False;kek[v,u]:=False;
                        kek[k,v]:=False;kek[v,k]:=False;
                        dfs(v);
                end;
        end;
End;
BEGIN
        Data;
        Fillchar(kek,sizeof(kek),True);
        For i:=1 to n do
        begin
                Fillchar(kt,sizeof(kt),true);
                k:=i;
                dfs(i);
        end;
        kq:=0;
        For i:=1 to n-1 do
                For j:=i+1 to n do If kek[i,j] then inc(kq);
        Writeln(g,kq);
        Close(f);CLose(g);
END.
