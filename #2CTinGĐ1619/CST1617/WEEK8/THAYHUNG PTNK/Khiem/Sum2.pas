uses    math;
const   fi='Sum2.inp';
        fo='Sum2.out';
        inf=trunc(1e9);
var     n,l,u:longint;
        A:array [1..100001] of integer;
procedure nhap;
var     i:longint;
begin
        assign(input,fi);reset(input);
        readln(n,l,u);
        for i:=1 to n do read(A[i]);
end;
procedure xuat;
var     i,j,s,kq:longint;
begin
        assign(output,fo);rewrite(output);
        kq:=-inf;s:=0;j:=1;
        for i:=1 to n do
        begin
                s:=s+A[i];
                if i-j+1>=l then kq:=max(kq,s);
                while (i-j+1>l) and ((i-j+1=u) or (s-A[j]>s)) do
                begin
                        dec(s,A[j]);
                        kq:=max(kq,s);
                        inc(j);
                end;
        end;
        write(kq);
end;
begin
        nhap;
        xuat;
end.
