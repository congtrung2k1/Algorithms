var f: array [1..10000000] of longint;
    n,k,m,max,i,j: longint;
    sum: int64;

procedure pt(a: longint);
  var i: longint;
  begin
      if a<=1 then exit;
      i:=1;
      while i<=trunc(sqrt(a)) do
        begin
            if i<3 then inc(i) else inc(i,2);
            while (a<>1) and (a mod i = 0) do
              begin
                  inc(f[i]);
                  a := a div i;
              end;
        end;
      if a<>1 then inc(f[a]);
      if i>max then max:=i else if a>max then max:=a;
  end;

procedure pt2(a: longint);
  var i: longint;
  begin
      if a<=1 then exit;
      i:=1;
      while i<=trunc(sqrt(a)) do
        begin
            if i<3 then inc(i) else inc(i,2);
            while (a <> 1) and (a mod i = 0) do
              begin
                  dec(f[i]);
                  a := a div i;
              end;
        end;
      if a<>1 then dec(f[a]);
      if i>max then max:=i else if a>max then max:=a;
  end;

BEGIN
    read(n,k,m);

    fillchar(f,sizeof(f),0);
    max:=0;
    for i:=1 to n do
      begin
          pt(i);
          if i<=k then pt2(i);
          if i<=n-k then pt2(i);
      end;

    sum:=1;
    for i:=2 to max do
      if f[i]>0 then
        for j:=1 to f[i] do sum:=(sum * i) mod m;
    writeln(sum);
END.