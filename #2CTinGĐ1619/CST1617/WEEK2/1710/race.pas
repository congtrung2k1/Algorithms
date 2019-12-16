Const fi = 'race.inp';
      fo = 'race.out';
      maxn = 100001;
Type point = record
     v,index:longint;
     end;
     arr = array[1..maxn] of point;
Var n,stackCount:longint;
    stack:array[1..maxn] of longint;
    a,b:array[1..maxn] of point;
    chosen:array[1..maxn] of boolean;
    f,g:text;

Procedure init;
var i:longint;
begin
    assign(f,fi); reset(f);
    read(f,n);
    for i:=1 to n do begin read(f,a[i].v); a[i].index:=i; end;
    for i:=1 to n do begin read(f,b[i].v); b[i].index:=i; end;
    close(f);
end;

procedure push(i:longint);
begin
    inc(stackCount);
    stack[stackCount]:=i;
end;

function pop:longint;
begin
    dec(stackCount);
    exit(stack[stackCount + 1]);
end;

function empty:boolean;
begin
    exit(stackCount = 0);
end;

procedure quicksort(var x:arr; c,d:longint);
var i,j,mid:longint;
    tmp:point;
begin
    i:=c; j:=d; mid:=x[(c + d) div 2].v;
    repeat
        while x[i].v < mid do inc(i);
        while x[j].v > mid do dec(j);
        if i <= j then
        begin
            tmp:=x[i];
            x[i]:=x[j];
            x[j]:=tmp;
            inc(i);
            dec(j);
        end;
    until i > j;
    if c < j then quicksort(x,c,j);
    if i < d then quicksort(x,i,d);
end;

procedure Try;
var i,j:longint;
begin
    quicksort(a,1,n);
    quicksort(b,1,n);
    Assign(F,FO); Rewrite(F);
    j:=1;
    for i:=1 to n do
    begin
        while (a[i].v > b[j].v) and (j <= n) do
        begin
            push(j);
            inc(j);
        end;
        if not empty then
        begin
            chosen[i]:=true;
            writeln(f,a[i].index,' ',b[pop].index);
        end;
    end;
    while (j <= n) do begin push(j); inc(j); end;
    for i:=1 to n do
     if not chosen[i] then writeln(f,a[i].index,' ',b[pop].index);
    Close(F);
end;

begin
   Init;
   Try;
end.
