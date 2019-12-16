const
        fi='sum2.inp';
        fo='sum2.out';
        vocuc=1000000000000000;
var     f:text;
        n,l,r:longint;
        a:array[1..100001] of longint;
        ans:int64;
{}
procedure docf;
var     i,j:longint;
begin
        assign(f,fi); reset(f);
        readln(f,n,l,r);
        for i:=1 to n do
                read(f,a[i]);
        close(f);
end;
{}
procedure lam;
var     i,j,u,v,d:longint;
        sum:int64;
begin
        j:=1; sum:=0;
        ans:=-vocuc;

        for i:=1 to n do
        begin
                d:=i-j+1;
                if (d>r) then
                begin sum:=sum-a[j]; inc(j); end;

                sum:=sum + a[i];
                if (ans < sum) and (l<=d) and (d<=r) then
                        ans:=sum;
                while (j<=i) and (i-j+1>l) and (a[j]<=0) do
                begin
                        dec(sum,a[j]);
                        inc(j);
                        if sum > ans then ans:=sum;
                end;
        end;
end;
{}
procedure xuat;
begin
        assign(f,fo); rewrite(f);
        writeln(f,ans);
        close(F);
end;
{}
begin
        docf;
        lam;
        xuat;
end.
