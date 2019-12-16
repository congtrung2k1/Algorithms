const fi='RANKING1.INP';
      fo='RANKING1.OUT';
      max=trunc(1e5);
type mang=array[1..100000] of int64;
var f,g:text;
    n,m:longint;
    a,cs,vt:mang;
    truyvan,c,kq:array[1..100000] of longint;
procedure Doc;
var i:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m);
        for i:=1 to n do
        begin
                read(f,a[i]);
                vt[i]:=i;
        end;
        for i:=1 to m do read(f,truyvan[i]);
        close(f);
end;
procedure Swap(var a,b:int64);
var temp:int64;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
procedure Sort(l,r:longint);
var i,j,k:longint;
begin
        i:=l;
        j:=r;
        k:=a[random(r-l+1)+l];
        repeat
                while a[i]<k do inc(i);
                while a[j]>k do dec(j);
                if i<=j then
                begin
                        Swap(a[i],a[j]);
                        Swap(vt[i],vt[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure SortVt(l,r:longint);
var i,j,k:longint;
begin
        i:=l;
        j:=r;
        k:=vt[random(r-l+1)+l];
        repeat
                while vt[i]<k do inc(i);
                while vt[j]>k do dec(j);
                if i<=j then
                begin
                        Swap(a[i],a[j]);
                        Swap(vt[i],vt[j]);
                        Swap(cs[i],cs[j]);
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then SortVt(i,r);
        if l<j then SortVt(l,j);
end;
procedure Update(i:longint);
begin
        while i<=max do
        begin
                inc(c[i]);
                i:=i+i and (-i);
        end;
end;
function Get(i:longint):longint;
var sum:longint;
begin
        sum:=0;
        while i>0 do
        begin
                sum:=sum+c[i];
                i:=i-i and (-i);
        end;
        exit(sum);
end;
procedure Solve;
var i,res:longint;
begin
        for i:=1 to n do cs[i]:=i;
        SortVt(1,n);
        res:=0;
        for i:=1 to n do
        begin
                res:=Get(max)-Get(cs[i]-1);
                kq[i]:=res;
                Update(cs[i]);
        end;
        assign(g,fo);
        rewrite(g);
        for i:=1 to m do
        begin
                writeln(g,kq[truyvan[i]]+1);
        end;
        close(g);
end;
begin
        Doc;
        Sort(1,n);
        Solve;
end.

