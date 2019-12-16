const   fi='Circle.inp';
        fo='Circle.out';
        inf=trunc(2e9);
type    round=record x,y:longint;end;
var     n:longint;
        A:array [0..300000] of round;
procedure nhap;
var     i,x,r:longint;
begin
        assign(input,fi);reset(input);
        readln(n);
        for i:=1 to n do
        begin
                readln(x,r);
                A[i].x:=x-r;A[i].y:=x+r;
        end;
end;
function comp(a,b:round):boolean;
begin
        if a.x<b.x then exit(true);
        if a.x>b.x then exit(false);
        if a.y>b.y then exit(true);
        exit(false);
end;
procedure qs(l,h:longint);
var     i,j:longint;g,t:round;
begin
        i:=l;j:=h;g:=A[(l+h) div 2];
        repeat
                while comp(A[i],g) do inc(i);
                while comp(g,A[j]) do dec(j);
                if i<=j then
                begin
                        t:=A[i];A[i]:=A[j];A[j]:=t;
                        inc(i);dec(j);
                end;
        until i>j;
        if i<h then qs(i,h);
        if j>l then qs(l,j);
end;
function isout(a,b:round):boolean;
begin
        if (a.x>=b.x) and (a.y<=b.y) then exit(false) else exit(true);
end;
procedure xuat;
var     i,ns,kq:longint;
        S,Lim:array [0..300000] of longint;
begin
        assign(output,fo);rewrite(output);
        qs(1,n);
        fillchar(S,sizeof(S),0);
        fillchar(Lim,sizeof(Lim),0);
        for i:=1 to n do lim[i]:=A[i].x;
        ns:=0;kq:=0;Lim[0]:=-inf;
        for i:=1 to n do
        begin
                while (ns>0) and isout(A[i],A[S[ns]]) do dec(ns);
                if A[i].x=lim[S[ns]] then lim[S[ns]]:=A[i].y else lim[S[ns]]:=-inf;
                inc(kq);inc(ns);S[ns]:=i;
        end;
        for i:=1 to n do if lim[i]=A[i].y then inc(kq);
        write(kq+1);
end;
begin
        nhap;
        xuat;
end.
