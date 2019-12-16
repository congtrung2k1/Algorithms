uses math;
type mm = record
        s,e: longint;
     end;
const nmax = 1020;
      oo = 100000000;
var time: array [1..nmax,1..nmax] of mm;
    c: array [1..nmax,1..nmax] of longint;
    d, king: array [1..nmax] of longint;
    n,m,a,b,k,g,u,v,cc,st,i: longint;

procedure dijkstra();
var i,u,s,v,tmp: longint;
    fre: array [1..nmax] of boolean;
begin
        for i:=1 to n do fre[i]:= true;
        for i:=1 to n do d[i]:=oo;
        d[a]:=k;
        while true do begin
                u:= -1; s:=oo;
                for i:=1 to n do
                        if (d[i] < s) and (fre[i]) then begin u:=i; s:=d[i]; end;

                if (u = -1) or (u = b) then exit;
                fre[u]:=false;

                for v:=1 to n do
                        if (c[u][v] > 0) then begin
                                if (d[u] >= time[u,v].s) and (d[u] <= time[u,v].e) then
                                        tmp:=time[u,v].e + 1 - d[u]
                                else
                                        tmp:=0;
                                if (fre[v]) then
                                        d[v]:=min(d[v], d[u] + c[u,v] + tmp);
                        end;
        end;
end;

BEGIN
        assign(input,'ATIME.inp'); reset(input);

        read(n,m,a,b,k,g);
        for i:=1 to g do read(king[i]);
        for i:=1 to m do begin
                read(u,v,cc);
                c[u,v]:= cc;
                c[v,u]:= cc;
        end;
        st:=0;
        for i:=2 to g do begin
                time[king[i-1], king[i]].s:=st;
                time[king[i-1], king[i]].e:= st + c[king[i-1], king[i]] - 1;
                time[king[i], king[i-1]]:= time[king[i-1], king[i]];
                st:= time[king[i-1], king[i]].e + 1;
        end;
        dijkstra();

        assign(output, 'ATIME.out'); rewrite(output); write(d[b] - k); close(output);
END.