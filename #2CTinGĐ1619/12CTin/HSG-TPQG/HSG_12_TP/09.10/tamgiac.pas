uses math;
var n,i,j,z,ans: longint;
    s: array [1..100] of string;
    a: array [1..100,1..10000] of longint;

BEGIN
        assign(input,'tamgiac.inp'); reset(input);
        assign(output,'tamgiac.out'); rewrite(output);

        readln(n);
        repeat
                ans:=0;

                for i:=1 to n do begin
                        readln(s[i]);
                        if (i > 1) then
                                while length(s[i - 1]) > length(s[i]) do s[i]:= s[i] + ' ';
                        for j:=1 to length(s[i]) do
                                if s[i][j] = '-' then a[i][j]:= a[i][j-1] + 1 else a[i][j]:= 0;
                end;

                for i:=1 to n do
                for j:=1 to length(s[i]) do
                        if (a[i][j] mod 2 = 1) then begin
                                z:=0;
                                while z < a[i][j] div 2 do begin
                                        inc(z);
                                        if ((i + z <= n) and (j - z >= 1)) then
                                                if a[i + z][j - z] <> a[i][j] - 2 * z then break;
                                end;
                                if ((i + z <= n) and (j - z >= 1) and (a[i + z][j - z] = 1)) then
                                ans:= max(ans, ((a[i][j] + 1) div 2) * (a[i][j] + 1) div 2);

                                z:=0;
                                while z < a[i][j] div 2 do begin
                                        inc(z);
                                        if ((i - z > 0) and (j - z >= 1)) then
                                                if a[i - z][j - z] <> a[i][j] - 2 * z then break;
                                end;
                                if ((i - z > 0) and (j - z >= 1) and (a[i - z][j - z] = 1)) then
                                ans:= max(ans, ((a[i][j] + 1) div 2) * (a[i][j] + 1) div 2);
                        end;

                writeln(ans);

                readln(n);
        until (n = 0);

        close(output);
END.