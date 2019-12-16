uses math;
var x,y: array [0..10000] of int64;
    n,h,i,u,r,first,rear: longint;
    queue, rank: array [0..10000] of longint;
    fre: array [0..10000] of boolean;

procedure push(i,r: longint);
begin
    inc(rear);
    queue[rear]:=i;
    fre[i]:=true;
    rank[i]:=r;
end;

function tinh(i,u: longint): longint;
begin
        exit(trunc(sqrt(sqr(x[i] - x[u]) + sqr(y[i] - y[u]))));
end;

BEGIN
        assign(input,'jump.inp'); reset(input);
        assign(output,'jump.out'); rewrite(output);

        read(h,n);
        for i:=1 to n do read(x[i], y[i]);

        rear:=-1;
        for i:=1 to n do if y[i] <= 1000 then push(i,1);
        repeat
                u:=queue[first]; inc(first);
                r:=rank[u];
                if (h - y[u] <= 1000) then begin
                        write(r); exit;
                end;
                for i:=1 to n do
                        if not fre[i] and (tinh(i,u) <= 1000) then push(i,r + 1);
        until first > rear;
END.