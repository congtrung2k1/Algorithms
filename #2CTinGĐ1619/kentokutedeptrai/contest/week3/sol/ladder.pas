const fi = 'ladder.inp';
      fo = 'ladder.out';
var f,g: text;
    n,m,i,x,y,u,v: longint;
    a,l,r: array [1..100000] of longint;

procedure init;
  var i: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n,m);
      for i:=1 to n do read(f,a[i]);

      for i:=1 to n do
        begin
            l[i]:=i;
            while (l[i]<n) and (a[l[i]] <= a[l[i]+1]) do inc(l[i]);
        end;
      for i:=n downto 1 do
        begin
            r[i]:=i;
            while (1<r[i]) and (a[r[i]] <= a[r[i]-1]) do dec(r[i]);
        end;
  end;

BEGIN
    init;
    assign(g,fo); rewrite(g);
    for i:=1 to m do
      begin
          read(f,u,v);
          if l[u] >= r[v] then writeln(g,'1') else writeln(g,'0');
      end;
    close(g);
END.