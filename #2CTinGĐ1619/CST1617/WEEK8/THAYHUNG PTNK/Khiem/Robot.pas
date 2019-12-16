const   fi='Robot.inp';
        fo='Robot.out';
        kn=trunc(1e5);
        inf=trunc(1e15);
type    jump=record x,y,t:longint;end;
var     n,m,x,nh:longint;
        H,Head,Heap,pos:array [1..kn] of longint;
        D:array [1..kn] of int64;
        S:array [1..6*kn] of jump;
        Link:array [1..6*kn] of longint;
procedure nhap;
var     i:longint;
begin
        assign(input,fi);reset(input);
        readln(n,m,x);
        for i:=1 to n do readln(H[i]);
        for i:=1 to m do
        begin
                readln(S[i].x,S[i].y,S[i].t);
                S[i+m].x:=S[i].y;S[i+m].y:=S[i].x;S[i+m].t:=S[i].t;
        end;
        for i:=m*2 downto 1 do
                with S[i] do
                begin
                        Link[i]:=Head[x];
                        Head[x]:=i;
                end;
end;
procedure init;
var     i:longint;
begin
        for i:=1 to n do D[i]:=inf;
        D[1]:=0;
end;
procedure push(x:longint);
var     i,j:longint;
begin
        i:=pos[x];
        if i=0 then
        begin
                inc(nh);
                i:=nh;
        end;
        while i<>1 do
        begin
                j:=i div 2;
                if D[x]>D[Heap[j]] then break;
                Heap[i]:=Heap[j];
                pos[Heap[j]]:=i;
                i:=j;
        end;
        Heap[i]:=x;
        Pos[x]:=i;
end;
function pop:longint;
var     i,j,x:longint;
begin
        pop:=Heap[1];
        x:=Heap[nh];
        dec(nh);
        i:=1;
        while i*2<=nh do
        begin
                j:=i*2;
                if (j<nh) and (D[Heap[j]]>D[Heap[j+1]]) then inc(j);
                if D[x]<D[Heap[j]] then break;
                Heap[i]:=Heap[j];
                pos[Heap[j]]:=i;
                i:=j;
        end;
        Heap[i]:=x;
        pos[x]:=i;
end;
procedure Dijkstra;
var     u,v,i:longint;
begin
        push(1);
        while nh<>0 do
        begin
                u:=pop;
                if u=n then break;
                i:=Head[u];
                while i<>0 do
                begin
                        v:=S[i].y;
                        if H[u]>=S[i].t then
                                if D[v]>D[u]+S[i].t*2 then
                                begin
                                        D[v]:=D[u]+S[i].t*2;
                                        push(v);
                                end;
                        i:=Link[i];
                end;
        end;
end;
procedure xuat;
begin
        assign(output,fo);rewrite(output);
        init;
        Dijkstra;
        if D[n]=inf then write(-1) else write(D[n]+H[n]);
end;
begin
        nhap;
        xuat;
end.