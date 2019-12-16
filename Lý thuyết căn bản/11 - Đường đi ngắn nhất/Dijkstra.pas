{$MODE DELPHI}
const fi = 'MINPATH.INP';
      fo = 'MINPATH.OUT';
      max = 1000;
      maxEC = 1000;
      maxC = max * maxEC;
var n,s,f: longint;
    c: array [1..max,1..max] of longint;
    d,a: array [1..max] of longint;
    free: array [1..max] of boolean;

procedure init;
  var ff: text;
      m,u,v,i: longint;
  begin
    assign(ff,fi); reset(ff);
    read(ff,n,m,s,f);

    for u:=1 to n do
      for v:=1 to n do
        if u=v then c[u,v]:=0 else c[u,v]:=maxC;
    for i:=1 to m do read(ff,u,v,c[u,v]);
    close(ff);

    for i:=1 to n do d[i]:=maxlongint;
    d[s]:=0;
  end;

procedure dijkstra;
  var u,i,min,v: longint;
  begin
    repeat
      u:=0; min:=maxC;                                              // tim d[u] nho nhat de co dinh
      for i:=1 to n do
        if (free[i]=false) and (d[i] < min) then
          begin
            u:=i;
            min:=d[i];
          end;

      if (u=0) or (u=f) then break;                                 // dung neu het dinh trong hay do la dinh f
      free[u]:=true;

      for v:=1 to n do                                              // dinh d[v] theo cong thuc d[v]:=min(d[v],d[u]+c[u,v])
        if (free[v]=false) and (d[v] > d[u] + c[u,v]) then
           begin
             d[v]:=d[u] + c[u,v];
             a[v]:=u;
           end;
    until false;
  end;

procedure out;                                                        // truy vet
  var ff: text;
  begin
    assign(ff,fo); rewrite(ff);

    if d[f]=maxlongint then writeln(ff,'-1')
    else
      begin
        writeln('Distance from ',s,' to ',f,': ',d[f]);
        while f<>s do
          begin
            write(ff,f,' <- ');
            f:=a[f];
          end;
        writeln(ff,s);
      end;
    close(ff);
  end;

BEGIN
  init;
  dijkstra;
  out;
END.
