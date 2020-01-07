uses math;
const fin='';
        fout='';
var f,g:text;
        i,n,p,j,kq,t,s:longint;
        a,it,b:array[0..500000] of longint;

procedure build(k,l,r:longint);
var m:longint;
begin
        if l=r then
        begin
                it[k]:=a[l];
                b[k]:=l;
                exit;
        end;
        m:=(l+r) div 2;
        build(k*2,l,m);
        build(k*2+1,m+1,r);
        it[k]:=max(it[k*2],it[k*2+1]);
end;
function request(k,l,r,u,x:longint):longint;
var m:longint;
begin
        if l=r then exit(l);
        m:=(l+r) div 2;
        if it[k*2+1]>=x then
        begin
            exit(request(k*2+1,m+1,r,u,x));
        end
        else 
        if (it[k*2]>=x) and (u<=m) then
            exit(request(k*2,l,m,u,x))
        else exit(-1);
end;

begin
        assign(f,fin);reset(f);
        assign(g,fout);rewrite(g);
        readln(f,n,p);
        a[0]:=0;
        for i:=1 to n do
        begin
                read(f,t);
                a[i]:=a[i-1]+t;
        end;
        kq:=-1;
        build(1,1,n);
        for i:=0 to n-1 do
                kq:=max(request(1,1,n,i+1,p+a[i])-i,kq);
        write(g,kq);
        close(f);
        close(G);
end.