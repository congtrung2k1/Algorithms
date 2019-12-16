const fi = 'DIGITS.INP';
      fo = 'DIGITS.OUT'; 
      a: array [1..10] of int64=(9,99,999,9999,99999,999999,9999999,99999999,999999999,9999999999);

var n: longint;
    s: string;
    x,sum: int64;
    f: text;

BEGIN
    assign(f,fi); reset(f); read(f,n); close(f);
    str(n,s);
    if n<=9 then begin writeln(n); halt; end;

    sum:=0;
    while n>9 do
      begin
          x:=n - a[length(s)-1];
          sum:=sum + x*length(s);
          n:=a[length(s)-1]; str(n,s);
      end;
    inc(sum,n);

    assign(f,fo); rewrite(f); writeln(f,sum); close(f);
END.