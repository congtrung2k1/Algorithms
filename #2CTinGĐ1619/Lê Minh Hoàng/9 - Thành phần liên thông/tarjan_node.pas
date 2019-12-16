uses math;
const fin='';
        fout='';

type pnode=^tnode;
        tnode=record
                info:longint;
                next:pnode;
        end;

var f,g:text;
        i,n,m,u,v,count,st,tplt:longint;
        a:array[1..10010] of pnode;
        free:array[1..10010] of boolean;
        low,number,stk:array[1..10100] of longint;
procedure install(u,v:longint);
var i:pnode;
begin
        new(i);
        i^.info:=v;
        i^.next:=a[u];
        a[u]:=i;
end;

procedure visit(x:longint);
var i:pnode;
        v:longint;
begin
        inc(count);number[x]:=count;
        low[x]:=count;
        i:=a[x];
        inc(st);
        stk[st]:=x;
        while i<> nil do
        begin
                if free[i^.info] then
                begin
                        if number[i^.info]<>0 then
                                low[x]:=min(low[x],number[i^.info])
                        else
                        begin
                                visit(i^.info);
                                low[x]:=min(low[x],low[i^.info]);
                        end;

                end;
                i:=i^.next;
        end;
        if low[x]=number[x] then
        begin
                inc(tplt);
                repeat
                        v:=stk[st];
                        dec(st);
                        free[v]:=false;
                until x=v;
        end;
end;

begin
        assign(f,fin);reset(f);
        assign(g,fout);rewrite(g);
        readln(f,n,m);
        fillchar(number,sizeof(number),0);
        for i:=1 to m do
        begin
                read(f,u,v);
                install(u,v);
        end;
        fillchar(free,sizeof(free),true);
        for i:=1 to n do
                if free[i] then
                begin
                        visit(i);
                end;
        write(g,tplt);
        close(f);
        close(g);
end.
