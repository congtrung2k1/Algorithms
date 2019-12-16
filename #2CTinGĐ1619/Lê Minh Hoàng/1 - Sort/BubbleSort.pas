var n,i,j,t,x: longint;
    yes: boolean;
    a: array [1..10] of longint;

BEGIN
    n:=10;
    for i:=1 to n do read(a[i]);

    repeat
        yes:=true;
        for i:=1 to n-1 do
          if a[i] > a[i+1] then
            begin
                t:=a[i]; a[i]:=a[i+1]; a[i+1]:=t;
                yes:=false;
            end;
    until yes;

    for i:=1 to n do write(a[i],' ');
END.