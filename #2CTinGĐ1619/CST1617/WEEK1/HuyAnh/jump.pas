// Nguyen Huy Anh

uses math;
const fi='JUMP.INP';
      fo='JUMP.OUT';
var f,g:text;
    d:array[0..1000,0..1000] of longint;
    a:array[1..1000] of longint;
    n:longint;
procedure Doc;
var i:integer;
begin
        assign(f,fi);
        reset(f);
        readln(f,n);
        for i:=1 to n do read(f,a[i]);
        close(f);
end;
procedure XuLi;
var i,j:integer;
    minkq:longint;
begin
        for i:=0 to n do
        begin
                for j:=0 to n do d[i,j]:=500000;
        end;
        d[1,0]:=0;
        d[2,1]:=a[2];
        for i:=2 to n do
        begin
                for j:=1 to n do
                begin
                        if (i-j>0) and (j-1>0) and (i-1>0) then
                        begin
                                if d[i-j,j-1]+a[i]<d[i,j] then d[i,j]:=d[i-j,j-1]+a[i];
                                if d[i-1,j-1]+a[i-j]+a[i]<d[i,j] then d[i,j]:=d[i-1,j-1]+a[i-j]+a[i];
                        end;
                end;
        end;
        minkq:=maxlongint;
        for i:=1 to n do if d[n,i]<minkq then minkq:=d[n,i];
        assign(g,fo);
        rewrite(g);
        write(g,minkq);
        close(g);
end;
begin
        Doc;
        XuLi;
end.
