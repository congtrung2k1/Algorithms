var n,i,j,t,x: longint;
    a: array [1..10] of longint;
BEGIN
    n:=10;
    for i:=1 to n do read(a[i]);

    for j:=1 to n-1 do
      begin
          x:=j;
          for i:=j+1 to n do
            if a[x] > a[i] then x:=i;
          t:=a[j]; a[j]:=a[x]; a[x]:=t;
      end;

    for i:=1 to n do write(a[i],' ');
END.