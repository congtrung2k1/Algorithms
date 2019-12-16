uses math;
var n, h, i, j, p, c: longint;
    dp: array [0..100, 0..50000] of longint;

BEGIN
        assign(input,'food.inp'); reset(input);
        assign(output,'food.out'); rewrite(output);
        read(n,h);
        for i := 1 to h do dp[0][i] := 1000000000;
        for i := 1 to n do begin
                read(p,c);
                for j:=1 to h do begin
                        dp[i][j] := dp[i - 1][j];
                        if j >= p then dp[i][j] := min(dp[i][j], c + dp[i][j - p]);
                end;
        end;
        write(dp[n][h]);
END.
