uses math;
const fi = '';
      fo = '';
      nmax = 10001;
var s: array [1..8] of integer=(0,1,2,4,5,8,9,10);
    dp: array [0..nmax,1..8] of int64;
    a: array [0..3,0..nmax] of longint;
    n,i,j,tmp,k,ans: longint;
    f: text;

BEGIN
    assign(f,fi); reset(f);
    read(f,n);
    for i:=0 to 3 do
      for j:=1 to n do read(f,a[i,j]);
    close(f);

    fillchar(dp,sizeof(dp),0);
    for i:=1 to n do
      for j:=1 to 8 do
        begin
            tmp:=0;
            for k:=0 to 3 do tmp:=tmp + ((s[j] shr k) and 1)*a[k,i];
            for k:=1 to 8 do
              if (s[j] and s[k] = 0) and (dp[i,j] < dp[i-1,k] + tmp) then dp[i,j]:=dp[i-1,k] + tmp;
        end;

    assign(f,fo); rewrite(f);

    ans:=-maxlongint;
    for i:=1 to 8 do ans:=max(ans, dp[n,i]);

    tmp:=-maxlongint;
    for i:=1 to n do
      for j:=0 to 3 do tmp:=max(tmp, a[j,i]);
    if tmp<=0 then begin writeln(f,tmp); close(f); halt; end;

    writeln(f,ans); close(f);
END.
