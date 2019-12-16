uses math;
const   fi='giaohang.inp';
        fo='giaohang.out';
        //giaohang.out
var     a:array[0..1000,0..1001] of longint;
        v,s,q:array[0..1000] of longint;
        n,l:longint;
procedure nhap;
var     i,j:longint;
begin
        assign(input,fi);
        reset(input);
        readln(n);
        for i:=0 to n-1 do
        begin
                read(a[i,0]);
                for j:=1 to a[i,0] do
                begin
                        read(a[i,j]);
                        inc(v[a[i,j]]);
                end;
        end;
end;
procedure dfs(i,k:longint);
var     j,t:longint;
begin

        q[i]:=k;
        for j:=1 to a[i,0] do
        begin
                if (q[a[i,j]]=0) or (q[a[i,j]]=q[i]) then
                begin
                        t:=a[i,j];
                        a[i,j]:=n;
                        dfs(t,k);
                        break;
                end;
        end;
        for j:=j+1 to a[i,0] do
                if q[a[i,j]]=0 then
                begin
                        dec(v[a[i,j]]);
                        if v[a[i,j]]=0 then
                        begin
                                inc(l);
                                s[l]:=a[i,j];
                        end;
                end;
end;
procedure xuli;
var     i,d:longint;
begin
        assign(output,fo);
        rewrite(output);
        q[n]:=n;
        l:=0;
        d:=0;
        for i:=0 to n-1 do a[i,n+1]:=max(1,a[i,0]);
        for i:=0 to n-1 do if v[i]=0 then
        begin
                inc(l);
                s[l]:=i;
        end;
        i:=1;
        while i<=l do
        begin
                dfs(s[i],i);
                inc(d);
                inc(i);
        end;
        write(d);
end;
BEGIN
        nhap;
        xuli;
END.
