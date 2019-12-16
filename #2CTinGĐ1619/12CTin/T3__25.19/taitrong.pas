uses math;
var n,i,j,k,l,m,u,v,s,t:longint;
    a:array[1..10000,1..10000]of longint;
    d,f:array[1..1000000] of longint;
    fi,fo: text;

begin
        assign(fi,'taitrong.inp'); reset(fi);
        assign(fo,'taitrong.out'); rewrite(fo);

        read(fi,n,m,s,t);
        for i:=1 to m do
        begin
                read(fi,u,v,k);
                a[u,v]:=k;
                a[v,u]:=k;
        end;

        f[s]:=high(longint);
        repeat
                k:=0; u:=0;
                for i:=1 to n do
                        if (f[i]>k) and (d[i]=0) then
                        begin
                                k:=f[i];
                                u:=i;
                        end;

                if (u=0) or (u = t) then break;

                d[u]:=1;
                for i:=1 to n do
                        if (i <> u) and (a[i,u] <> 0) and (d[i] = 0)then
                                if f[i] < min(f[u], a[i,u]) then
                                        f[i]:=min(f[u], a[i,u]);
        until false;
        if f[t] = 0 then writeln(fo,-1) else writeln(fo,f[t]);
        close(fo);
end.

