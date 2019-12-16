uses math;
var n,m,k,x,u,v,cnt,i: longint;
    a: array [1..1000,1..1000] of boolean;
    fre: array [1..1000] of boolean;

procedure dfs(u: longint);
var v: longint;
begin
        fre[u]:=true;
        for v:=1 to n do
                if not fre[v] and a[u][v] then dfs(v);
end;

BEGIN
        assign(input,'banhkeo.inp'); reset(input);
        assign(output,'banhkeo.out'); rewrite(output);
        read(n,m,k);

        x:=500;
        for i:=1 to k do begin
                read(k);
                x:=min(x, k);
        end;

        for i:=1 to m do begin
                read(u,v,k);
                a[u][v]:= a[u][v] or (k >= x);
                a[v][u]:= a[u][v];
        end;

        for i := 1 to n do
		if not fre[i] then begin 
			inc(cnt); dfs(i);
		end;

        write(cnt); close(output);
END.
