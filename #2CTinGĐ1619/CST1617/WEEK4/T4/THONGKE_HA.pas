const fi='THONGKE.INP';
      fo='THONGKE.OUT';
var f,g:text;
    head:array[1..10001] of longint;
    a,c:array[1..2000000] of longint;
    x,y,gt:array[1..1000000] of longint;
    kt:array[1..10000] of boolean;
    d,kq,pos,heap:array[1..10000] of int64;
    n,m,nheap:longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to m do
        begin
                read(f,x[i],y[i],gt[i]);
                inc(head[x[i]]);
                inc(head[y[i]]);
        end;
        for i:=2 to n+1 do head[i]:=head[i-1]+head[i];
        for i:=1 to m do
        begin
                a[head[x[i]]]:=y[i];
                a[head[y[i]]]:=x[i];
                c[head[x[i]]]:=gt[i];
                c[head[y[i]]]:=gt[i];
                dec(head[x[i]]);
                dec(head[y[i]]);
        end;
        close(f);
end;
procedure Update(v:longint);
var parent,child:longint;
begin
        child:=pos[v];
        if child=0 then
        begin
                inc(nheap);
                child:=nheap;
        end;
        parent:=child div 2;
        while (parent>0) and (d[heap[parent]]>d[v]) do
        begin
                heap[child]:=heap[parent];
                pos[heap[child]]:=child;
                child:=parent;
                parent:=child div 2;
        end;
        heap[child]:=v;
        pos[v]:=child;
end;
function Pop:longint;
var v,parent,child:longint;
begin
        Pop:=heap[1];
        v:=heap[nheap];
        dec(nheap);
        parent:=1;
        while parent*2<=nheap do
        begin
                child:=parent*2;
                if (child<nheap) and (d[heap[child+1]]<d[heap[child]]) then inc(child);
                if d[heap[child]]>=d[v] then break;
                heap[parent]:=heap[child];
                pos[heap[parent]]:=parent;
                parent:=child;
        end;
        heap[parent]:=v;
        pos[v]:=parent;
end;
procedure Dijkstra;
var u,i,v,j:longint;
begin
        for i:=1 to n do
        begin
                kt[i]:=true;
                d[i]:=maxlongint;
                kq[i]:=0;
        end;
        d[1]:=0;
        kq[1]:=1;
        Update(1);
        repeat
                u:=Pop;
                kt[u]:=false;
                for j:=head[u]+1 to head[u+1] do
                begin
                        v:=a[j];
                        if (kt[v]) and (d[v]>d[u]+c[j]) then
                        begin
                                d[v]:=d[u]+c[j];
                                kq[v]:=kq[u];
                                Update(v);
                        end
                        else
                        if d[v]=d[u]+c[j] then kq[v]:=2;
                end;
        until nheap=0;
        v:=0;
        for i:=1 to n do if (kq[i]>=2) and (d[i]<>maxlongint) then inc(v);
        assign(g,fo);
        rewrite(g);
        writeln(g,v);
        close(g);
end;
begin
        Doc;
        Dijkstra;
end.
