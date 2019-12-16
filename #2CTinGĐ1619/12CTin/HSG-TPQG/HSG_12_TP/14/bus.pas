uses math;
var n,m,i,j,s,f,u,v,front,rear: longint;
    a: array [1..2100, 1..2100] of longint;
    x: array [1..30] of longint;
    route, station, queue: array [1..2100] of longint;

procedure push(u: longint);
begin
        inc(rear);
        queue[rear] := u
end;

BEGIN
        assign(input,'bus.inp'); reset(input);
        assign(output,'bus.out'); rewrite(output);
        read(n);
        for i:=1 to 2100 do
                for j:=1 to 2100 do
                        if i = j then a[i][j] := 0 else a[i][j] := 3000;

        for i := 1 to n do begin
                m := 0;
                while not eoln do begin
                        inc(m);
                        read(x[m]);
                end;
                readln;

                for u:=1 to m - 1 do
                        for v:=u + 1 to m do begin
                                a[x[u]][x[v]] := min(a[x[u]][x[v]], v - u);
                                a[x[v]][x[u]] := min(a[x[v]][x[u]], v - u);
                        end
        end;

        read(s,f);
        fillchar(route, sizeof(route), $ff);
        route[s]:=0; station[s]:=1;
        front:=1; rear:=0;
        push(s);
        repeat
                u:=queue[front];
                inc(front);
                if u = f then begin
                        write(route[f], #32, station[f]);
                        halt
                end;
                for v := 1 to 2100 do
                        if (route[v] = -1) and (a[u][v] < 3000) then begin
                                route[v] := route[u] + 1;
                                station[v] := station[u] + a[u][v];
                                push(v)
                        end
                        else
                        if (route[u] + 1 = route[v]) and (a[u][v] < 3000) then
                                station[v] := min(station[v], station[u] + a[u][v])
        until first > rear;
END.
