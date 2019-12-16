uses math;
var n,m,k,i,j,z,x: longint;
    mau,cnt: array [0..101] of longint;
    dp: array [0..101,0..101,0..101] of longint;

function tinh(l,r,lak: longint): longint;
var i: longint;
begin
        if l > r then exit(0);
        if dp[l,r,lak] <> -1 then exit(dp[l,r,lak]);
        if l = r then
                if (lak + cnt[r] < k) then exit(k - lak - cnt[r]) else exit(0);

        dp[l,r,lak]:= tinh(l,r-1,0) + tinh(r,r,lak);
        for i:=l to r - 1 do
                if mau[i] = mau[r] then
                        dp[l,r,lak]:=min(dp[l,r,lak], tinh(l,i,lak + cnt[r]) + tinh(i+1, r-1, 0));
        exit(dp[l,r,lak]);
end;

BEGIN
        assign(input,'play.inp'); reset(input);

        read(n,k);
        m := 0; mau[m]:=0;
        for i:=1 to n do begin
                read(x);
                if (x = mau[m]) then inc(cnt[m]) else begin inc(m); mau[m]:=x; cnt[m]:=1; end;
        end;

        for i:=0 to 101 do
        for j:=0 to 101 do
        for z:=0 to 101 do dp[i,j,z] := -1;
        assign(output,'play.out'); rewrite(output); write(tinh(1,m,0)); close(output);
END.