const max = 100;
      fi = 'PATH.INP';
      fo = 'PATH.OUT';
var trace: array[1..max] of longint;
    a: array [1..max,1..max] of boolean;
    n,s,f: longint;

procedure enter;
  var ff: text;
      m,i,u,v: longint;
  begin
    assign(ff,fi); reset(ff);
    fillchar(a,sizeof(a),true);
    read(ff,n,m,s,f);
    for i:=1 to m do
      begin
        read(ff,u,v);
        a[u,v]:=true;
        a[v,u]:=true;
      end;
    close(ff);
  end;

procedure bfs;
  var queue: array [1..max] of longint;
      front, rear, u,v: longint;
  begin
    front:=1; rear:=1;
    queue[1]:=s;
    repeat
      u:=queue[front]; inc(front);

      for v:=1 to n do
        if a[u,v] and (trace[v]=0) then
          begin
            inc(rear); queue[rear]:=v;
            trace[v]:=u;
          end;
    until rear<front;
  end;

procedure out;
  var ff: text;
      i: longint;
  begin
    assign(ff,fo); rewrite(ff);
    writeln(ff,'From ',s,' you can  vist: ');
    for i:=1 to n do
      if trace[i]<>0 then write(ff,i,', ');
    writeln(ff);
    writeln(ff,'The path to ',f,' is:');
    if trace[f]=0 then writeln(ff,'NO SOLUTION')
    else
      begin
        while f<>s do
          begin
            write(ff,f,' <- ');
            f:=trace[f];
          end;
        writeln(ff,s);
      end;
    close(ff);
  end;

BEGIN
  enter;
  fillchar(trace,sizeof(trace),0);
  trace[s]:=-1;
  bfs;
  out;
END.
