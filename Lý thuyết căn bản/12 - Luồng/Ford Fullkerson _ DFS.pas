uses    math;
const   oo=round(1e18);
type    anode=^anode_data;
        anode_data=record
                info:longint;
                next:anode
        end;
var     n,m,u,v,source,sink:longint;
        a:array[1..100]of anode;
        c,f:array[1..100,1..100]of int64;
        visited:array[1..100]of boolean;
        trace:array[1..100]of longint;

procedure install(u,v:longint);
var     node:anode;
begin
        new(node);
        node^.info:=v;
        node^.next:=a[u];
        a[u]:=node
end;

procedure dfs(u:longint);
var     node:anode; v:longint;
begin
        visited[u]:=true;
        node:=a[u];
        while node<>nil do
        begin
                v:=node^.info; node:=node^.next;
                if (not visited[v]) and (c[u,v]>f[u,v]) then
                begin trace[v]:=u; dfs(v) end
        end
end;

function find_augment_path(source,sink:longint):boolean;
begin
        fillchar(visited,sizeof(visited),false);
        fillchar(trace,sizeof(trace),$ff);
        dfs(source);
        exit(visited[sink])
end;

procedure increase_flow(source,sink:longint);
var     u:longint; minCapacity:int64;
begin
        minCapacity:=oo;
        u:=sink;
        while u<>source do
        begin
                minCapacity:=min(minCapacity,c[trace[u],u]-f[trace[u],u]);
                u:=trace[u]
        end;
        u:=sink;
        while u<>source do
        begin
                inc(f[trace[u],u],minCapacity);
                dec(f[u,trace[u]],minCapacity);
                u:=trace[u]
        end
end;

procedure output_max_flow;
var     flow:int64; node:anode;
begin
        node:=a[source];
        flow:=0;
        while node<>nil do
        begin
                inc(flow,f[source,node^.info]);
                node:=node^.next
        end;
        write(flow)
end;

begin
        read(n,m,source,sink);
        fillchar(c,sizeof(c),0);
        for m:=1 to m do
        begin
                read(u,v,c[u,v]);
                install(u,v)
        end;
        fillchar(f,sizeof(f),0);
        while find_augment_path(source,sink) do
                increase_flow(source,sink);
        output_max_flow
end.