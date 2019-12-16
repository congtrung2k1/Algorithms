var a,b,t,s: ansistring;
    i,j,n,ans: integer;
    yes: boolean;

BEGIN
        assign(input,'fibo.inp'); reset(input);
        readln(n);
        readln(s);

        a:= 'A'; b:= 'B';
        for i:=3 to n do begin
                t:= a + b;
                a:= b;
                b:= t;
        end;

        for i:=1 to length(b) - length(s) + 1 do begin
                yes:= true;
                for j:=1 to length(s) do
                        if (b[i + j - 1] <> s[j]) then begin
                                yes:= false;
                                break;
                        end;
                if yes then inc(ans);
        end;

        close(input);
        assign(output,'fibo.out'); rewrite(output); writeln(ans);
        close(output);
END.