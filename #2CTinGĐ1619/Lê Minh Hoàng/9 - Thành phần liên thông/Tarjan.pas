uses math;
const fi = 'SCONNECT.inp';
      fo = 'SCONNECT.out';

var c: array [1..10000,1..10000] of boolean;
    free: array [1..10000] of boolean;
    stack,number,low: array [1..10000] of longint;
    i,n,count,top: longint;
    f: text;

procedure init;
  var m,i,u,v: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n,m);
      fillchar(c,sizeof(c),false);

      for i:=1 to m do
        begin
            read(f,u,v);
            c[u,v]:=true;
        end;
      fillchar(free,sizeof(free),true);
      fillchar(number,sizeof(number),0);
      fillchar(stack,sizeof(stack),0);
      top:=0;
      count:=0;
      close(f);
  end;

procedure out(u,v: longint);
  begin
      repeat
          v:=stack[top]; dec(top);
          write(f,v,' ');
          free[v]:=false;
      until u=v;
      writeln(f);
  end;

procedure visit(u: longint);
  var v: longint;
  begin
      inc(count); number[u]:=count;
      low[u]:=number[u];
      inc(top); stack[top]:=u;

      for v:=1 to n do
        if free[v] and c[u,v] then
          if number[v]=0 then
            begin
                visit(v);
                low[u]:=min(low[u],low[v]);
            end
          else low[u]:=min(low[u],number[v]);

      if number[u]=low[u] then out(u,v);
  end;

BEGIN
    init;
    assign(f,fo); rewrite(f);
    for i:=1 to n do
      if number[i]=0 then visit(i);
    close(f);
END.
