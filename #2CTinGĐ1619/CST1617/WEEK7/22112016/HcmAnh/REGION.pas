const fi='REGION.INP';
      fo='REGION.OUT';
type data=record
     id,reg,sc,med:longint;
     end;
var f,g:text;
    n,m,r,d,max,res:longint;
    a:array[1..100000] of data;
    sc:array[1..100000] of longint;
    kt:array[1..100000] of boolean;
    maxreg:array[1..100000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m,r);
        fillchar(sc,sizeof(sc),0);
        fillchar(maxreg,sizeof(maxreg),0);
        max:=-1;
        for i:=1 to n do
        begin
                readln(f,a[i].id,a[i].reg,a[i].sc,a[i].med);
                if a[i].sc>max then max:=a[i].sc;
                if a[i].sc>maxreg[a[i].reg] then maxreg[a[i].reg]:=a[i].sc;
                kt[i]:=true;
        end;
        close(f);
end;
procedure Swap(var a,b:data);
var temp:data;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
procedure Sort(l,r:longint);
var i,j,k,kmed,ksc:longint;
begin
        i:=l;
        j:=r;
        k:=random(r-l+1)+l;
        kmed:=a[k].med;
        ksc:=a[k].sc;
        repeat
                while (a[i].med<kmed) or ((a[i].med=kmed) and (a[i].sc<ksc)) do inc(i);
                while (a[j].med>kmed) or ((a[j].med=kmed) and (a[j].sc>ksc)) do dec(j);
                if i<=j then
                begin
                        Swap(a[i],a[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure Solve;
var i,d:longint;
begin
        assign(g,fo);
        rewrite(g);
        res:=0;
        d:=0;
        i:=n;
        while d<m do
        begin
                res:=a[i].sc;
                dec(n);
                inc(d);
        end;
        writeln(g,res);
        close(g);
end;
begin
        Doc;
        Sort(1,n);
        Solve;
end.
