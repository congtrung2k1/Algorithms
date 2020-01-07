const
  fi='';//stov.inp';
  fo='';//stov.out';
  maxn=trunc(1e5);
  maxm= trunc(1e6);
var
  n,m,i,j,dem,u,v,count : longint;
  link,head,ke : array[1..maxm] of longint;
  id : array[1..maxn] of longint;
  topo : boolean;
  cx : array[1..maxn] of boolean;
procedure add(i,u,v : longint);
  begin
    link[i] := head[u];
    head[u] := i;
    ke[i] := v;
  end;
procedure dfs(u : longint);
  var i,v : longint;
  begin
    cx[u] :=false;
    i := head[u];
    while i<>0 do
      begin
        v:= ke[i];
        if cx[v] then
          dfs(v);
        i := link[i];
      end;
    if topo then
      begin
        inc(count);
        id[count] := u;
      end;
  end;
procedure init;
  begin
    fillchar(cx,sizeof(cx),true);
    count := 0;
  end;
procedure process;
  var i,j : longint;
  begin
    init;
    topo := true;
    for i:=1 to n do
      if cx[i] then
        dfs(i);
    init;
    dem := 0; topo :=false;
    for i:= n downto 1 do
      if cx[id[i]] then
        begin
          inc(dem);
          dfs(id[i]);
        end;
  end;
begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
 
  readln(n,m); dem := 0;  
  for i:=1 to m do
    begin
       read(u,v);
       add(i,u,v);
    end;
 
    process;
    writeln(dem);
 
  close(output);close(input);
end.