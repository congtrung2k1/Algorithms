uses    math;
const   fi='Courses.inp';
        fo='Courses.out';
var     t:byte;n:longint;
        A:array [1..100000] of string;
procedure nhap;
var     i:longint;
begin
        readln(n);
        for i:=1 to n do readln(A[i]);
end;
function ss(a,b:string):boolean;
var     i:byte;
begin
        for i:=1 to min(length(a),length(b)) do
                if a[i]>b[i] then exit(false) else
                if a[i]<b[i] then exit(true);
        if length(a)<length(b) then exit(true) else exit(false);
end;
procedure Qs(l,h:longint);
var     i,j:longint;g,t:string;
begin
        if l>=h then exit;
        i:=l;j:=h;g:=A[(l+h) div 2];
        repeat
                while ss(A[i],g) do inc(i);
                while ss(g,A[j]) do dec(j);
                if i<=j then
                begin
                        t:=A[i];A[i]:=A[j];A[j]:=t;
                        inc(i);dec(j);
                end;
        until i>j;
        Qs(i,h);Qs(l,j);
end;
procedure xuat;
var     i,kq:longint;
begin
        Qs(1,n);
        kq:=1;
        for i:=2 to n do
                if pos(A[i-1],A[i])<>1 then inc(kq);
        writeln(kq);
end;
procedure xuly;
begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
        readln(t);
        while t<>0 do
        begin
                dec(t);
                nhap;
                xuat;
        end;
end;
begin
        xuly;
end.
