var c: array [1..1000,1..1000] of int64;
    free: array [1..1000] of boolean;
    d: array [1..1000] of int64;
    n,i,u,k: longint;
    val,smin: int64;

procedure init;
  var x,y: array [1..1000] of longint;
      i,j: longint;
  begin
      read(n,x[1],y[1]);
      for i:=2 to n do
        begin
            read(x[i],y[i]);
            for j:=i-1 downto 1 do
              begin
                  c[i,j]:=abs(x[i]-x[j]) + abs(y[i]-y[j]);
                  c[j,i]:=c[i,j];
              end;
        end;
      fillchar(free,sizeof(free),true);
      d[1]:=0;
      for i:=2 to n do d[i]:=maxlongint;
  end;

BEGIN
    init;
    val:=0;
    for k:=1 to n do
      begin
          smin:=maxlongint; u:=0;
          for i:=1 to n do
            if free[i] and (d[i] < smin) then
              begin smin:=d[i]; u:=i; end;

          inc(val,d[u]);

          free[u]:=false;
          for i:=1 to n do
            if free[i] and (d[i] > c[i,u]) then
              d[i]:=c[i,u];
      end;

    writeln(val);
END. 