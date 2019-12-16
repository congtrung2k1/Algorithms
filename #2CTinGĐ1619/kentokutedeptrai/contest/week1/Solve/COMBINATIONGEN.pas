var n,m,k,i: longint;
    a: array [1..10000] of longint;

BEGIN
    read(n,m);
    for i:=1 to m do read(A[i]);

    i:=m;
    while (i>0) and (a[i]=n-m+i) do dec(i);
    if i=0 then writeln(-1)
    else begin
             inc(a[i]);
             for i:=i+1 to m do a[i]:=a[i-1]+1;
             for i:=1 to m do write(A[i],' '); writeln;
         end;
END.