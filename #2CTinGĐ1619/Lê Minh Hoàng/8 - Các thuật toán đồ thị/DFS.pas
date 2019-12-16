const fi = 'PATH.INP';
      fo = 'PATH.OUT';
      max = 100;
var trace: array [0..max] of longint;
    a: array [0..max,0..max] of boolean;
    n,s,f: longint;

procedure enter;
  var i,u,v,m: longint;
      ff: text;
  begin
    assign(ff,fi); reset(ff);
    fillchar(a,sizeof(a),true);
    read(ff,n,m,s,f);
    for i:=1 to m do
      begin
        read(ff,u,v);
        a[u,v]:=true;
        a[v,u]:=a[u,v];
      end;
    close(ff);
  end;

procedure DFS(u: longint);
  var i: longint;
  begin
    for i:=1 to n do
      if a[u,i] and (trace[i]=0) then
        begin
          trace[i]:=u;
          DFS(i);
        end;
  end;

procedure result;
  var ff: text;
  begin
    assign(ff,fo); rewrite(ff);
    if trace[f]=0 then writeln(f,'NO SOLUTION')
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
  DFS(s);
  result
END.