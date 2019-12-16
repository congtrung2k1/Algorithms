const max = 1000;

var f: text;
    n,i,k,dem: longint;
    A: array [0..max] of longint;

BEGIN
    writeln ('Bai3');
    readln(n);

    if n>=5 then
      begin
        fillchar(A,sizeof(A),0);

        repeat
          dem:=0;
          for i:=1 to n-2+1 do
            if (A[i]=0) and (A[i+1]=1) then inc(dem);
          if dem=2 then
            for i:=1 to n do write(A[i]); writeln;

          while (i>0) and (A[i]=1) do dec(i);
          if i>0 then
            begin
              A[i] := 1;
              fillchar(A[i+1], (n-1)*sizeof(A[1]),0);
            end;
        until i=0;
      end else writeln (f,'Khong co gia tri');

    READLN
END.

