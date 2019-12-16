const
        fi='luckynum.inp';
        fo='luckynum.out';
        md=1000000007;
var     f:text;
        n,k:longint;
        ans:int64;
{}
procedure docf;
var     i,j:longint;
begin
        assign(f,fi); reset(f);
        readln(f,n,k);
        close(f);
end;
{}
function lt(a,b:longint):int64;
begin
        if b=1 then exit(a mod md)
        else if b=0 then exit(1)
        else exit( (lt(a,b div 2) mod md)*(lt(a, b - b div 2) mod md) mod md );
end;
{}
procedure lam;
var     i,j:longint;
begin
        if n=k then begin
                ans:=1;
                exit;
        end
        else begin
                ans:=lt(10,n-k) mod md;
                ans:=(ans + 8*lt(10,n-k-1) mod md) mod md;
                for i:=3 to n-k+1 do
                begin
                        ans:=(ans + 9*9*lt(10,n-k-2) mod md) mod md;
                end;
        end;
end;
{}
procedure xuat;
begin
        assign(f,fo); rewrite(f);
        writeln(f,ans);
        close(f);
end;
{}
begin
        docf;
        lam;
        xuat;
end.

