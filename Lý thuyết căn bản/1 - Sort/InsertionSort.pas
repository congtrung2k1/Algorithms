var n,i,j,t: longint;
    a: array [1..10] of longint;

BEGIN
    n:=10;
    for i:=1 to n do read(a[i]);

    for i:=2 to n do
      begin
          t:=a[i]; j:=i-1;

          while (j>0) and (t < A[j]) do
            begin
                a[j+1]:=a[j];
                dec(j);
            end;

          a[j+1]:=t;
      end;

    for i:=1 to n do write(a[i],' ');
END.