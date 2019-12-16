const   fi='Region.inp';
        fo='Region.out';
var     n,m,r:longint;
        id,reg,sc,med:array [0..100000] of longint;
procedure nhap;
var     i:longint;
        D:array [1..100000] of longint;
begin
        assign(input,fi);reset(input);
        readln(n,m,r);
        fillchar(D,sizeof(D),0);
        for i:=1 to n do
        begin
                readln(id[i],reg[i],sc[i],med[i]);
                if med[i]=1 then
                begin
                        dec(m);
                        D[reg[i]]:=-1;
                        sc[i]:=-1;
                end;
                if D[reg[i]]<>-1 then
                        if sc[i]>sc[D[reg[i]]] then D[reg[i]]:=i;
        end;
        for i:=1 to r do
        begin
                if D[i]>0 then dec(m);
                if D[i]=-1 then continue;
                sc[D[i]]:=-1;
        end;
end;
procedure swap(var a,b:longint);
var     t:longint;
begin
        t:=a;a:=b;b:=t;
end;
procedure Qs(l,h:longint);
var     i,j,g:longint;
begin
        if l>=h then exit;
        i:=l;j:=h;g:=sc[(l+h) div 2];
        repeat
                while sc[i]>g do inc(i);
                while sc[j]<g do dec(j);
                if i<=j then
                begin
                        swap(id[i],id[j]);
                        swap(reg[i],reg[j]);
                        swap(sc[i],sc[j]);
                        swap(med[i],med[j]);
                        inc(i);dec(j);
                end;
        until i>j;
        Qs(i,h);Qs(l,j);
end;
procedure xuat;
var     i:longint;
begin
        assign(output,fo);rewrite(output);
        Qs(1,n);
        i:=1;
        while m>0 do
        begin
                inc(i);
                dec(m);
        end;
        write(sc[i]+1);
end;
begin
        nhap;
        xuat;
end.
