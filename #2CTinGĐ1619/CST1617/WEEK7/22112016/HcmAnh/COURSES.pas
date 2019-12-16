const fi='COURSES.INP';
      fo='COURSES.OUT';
var f,g:text;
    t,n,res:longint;
    a:array[1..100000] of string;
procedure Sort(l,r:longint);
var i,j:longint;
    k,t:string;
begin
        i:=l;
        j:=r;
        k:=a[random(r-l+1)+l];
        repeat
                while a[i]<k do inc(i);
                while a[j]>k do dec(j);
                if i<=j then
                begin
                        t:=a[i];
                        a[i]:=a[j];
                        a[j]:=t;
                        inc(i);
                        dec(j);
                end;
        until i>j;
        if i<r then Sort(i,r);
        if l<j then Sort(l,j);
end;
procedure Solve;
var i:longint;
    x:string;
begin
        Sort(1,n);
        x:='';
        res:=0;
        for i:=1 to n do
        begin
                if pos(x,a[i])=0 then
                begin
                        x:=a[i];
                        inc(res);
                end;
        end;
end;
procedure Doc;
var i,j:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,t);
        assign(g,fo);
        rewrite(g);
        for i:=1 to t do
        begin
                readln(f,n);
                for j:=1 to n do readln(f,a[j]);
                Solve;
                writeln(g,res);
        end;
        close(g);
        close(f);
end;
begin
        Doc;
end.
