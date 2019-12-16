const fi='RANKING2.INP';
      fo='RANKING2.OUT';
      max=trunc(1e7)+1;
var f,g:text;
    a,kq:array[1..10000001] of longint;
    n,m,res:longint;
function Get(u:longint):longint;
var sum:longint;
begin
        sum:=0;
        while u>0 do
        begin
                sum:=sum+a[u];
                u:=u-u and (-u);
        end;
        exit(sum);
end;
procedure Update(i:longint);
begin
        while i<=max do
        begin
                a[i]:=a[i]+1;
                i:=i+i and (-i);
        end;
end;
procedure Doc;
var i,u:longint;
begin
        assign(f,fi);
        reset(f);
        fillchar(a,sizeof(a),0);
        readln(f,n,m);
        for i:=1 to n do
        begin
                read(f,u);
                res:=Get(max)-Get(u-1);
                kq[i]:=res;
                Update(u);
        end;
        assign(g,fo);
        rewrite(g);
        for i:=1 to m do
        begin
                read(f,u);
                writeln(g,kq[u]+1);
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.