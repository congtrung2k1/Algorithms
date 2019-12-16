{$MODE DELPHI}
const fi = 'MINPATH.INP';
      fo = 'MINPATH.OUT';
      max = 1000;
      maxEC = 1000;
      maxC = max * maxEC;
var n,s,f: longint;
    c: array [1..max,1..max] of longint;
    d,a: array [1..max] of longint;

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

procedure ford_Bellman;
  var i,u,v:  longint;
      stop: boolean;
  begin
    for i:=1 to n-1 do                                               // duyet khong qua n-1 lan
      begin
        stop:=true;
        for u:=1 to n do
          for v:=1 to n do
            if d[v] > d[u] + c[u,v] then                            // kiem tra xem co dinh v den u de toi uu u hay k
              begin
                d[v]:=d[u]+c[u,v];
                a[v]:=u;                                            // luu vet
                stop:=false;                                        // co thay doi
              end;
        if stop=true then break;
      end;
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
        write(ff,s);
      end;
    close(ff);
  end;

BEGIN
  init;
  ford_Bellman;
  out;
END.