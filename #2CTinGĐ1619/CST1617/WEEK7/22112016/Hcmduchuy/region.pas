const
        fi='region.inp';
        fo='region.out';
var     f:text;
        n,m,r:longint;
        id,score,place,cou:array[1..100010] of longint;
        tt1,tt2:array[1..100010] of boolean;
        ans,gh,minVal,maxVal:longint;
{}
procedure swap(var a,b:longint);
var     temp:longint;
begin
        temp:=a;
        a:=b;
        b:=temp;
end;
{}
procedure qsort;
procedure sort(l,r:longint);
var     i,j,tmp,mid,key:longint;
begin
        i:=l; j:=r;
        mid:=(i+j) div 2;
        key:=Score[mid];

        repeat
                while Score[i] > key do inc(i);
                while Score[j] < key do dec(j);

                if i<=j then
                begin
                        if i<>j then
                        begin
                                swap(id[i],id[j]);
                                swap(score[i],score[j]);
                                swap(place[i],place[j]);
                        end;
                        inc(i);dec(j);
                end;
        until i>j;

        if i<r then sort(i,r);
        if l<j then sort(l,j);
end;
begin
        sort(1,n);
end;
{}
procedure docf;
var     i,j,idx,scx,plx,stx,n2:longint;
begin
        assign(f,fi); reset(f);
        readln(f,n,m,r);
        n2:=0;
        minVal:=1000000010;
        maxVal:=-minVal;
        for i:=1 to n do
        begin
                readln(f,idx,plx,scx,stx);
                inc(cou[plx]);
                if stx=1 then
                begin
                        tt1[plx]:=true;
                        dec(m);
                end
                else begin
                        inc(n2);
                        id[n2]:=idx;
                        place[n2]:=plx;
                        score[n2]:=scx;


                        if minVal > score[n2] then minVal := score[n2];
                        if maxVal < score[n2] then maxVal := score[n2];
                end;
        end;

        n:=n2;

        close(F);
end;
{}
function check(diem:longint):boolean;
var     i,j,u,v,c:longint;
begin
        fillchar(tt2,r+1,false);
        c:=0;

        for i:=1 to n do
        begin
                if score[i] < diem then break;

                tt2[place[i]]:=true;
                inc(c);
                 if c > m then exit(false);
        end;

        for i:=1 to r do
        if not (tt1[i]) and not (tt2[i]) and (cou[i] > 0) then
        begin
                inc(c);
                 if c > m then exit(false);
        end;

        if c > m then exit(false);
        exit(true);
end;
{}
procedure lam;
var     dau,cuoi,giua:longint;
begin
        qsort;

        dau:=minVal; cuoi:=maxVal;

        repeat
                giua:=(dau + cuoi) div 2;
                if check(giua) then
                begin
                        ans:=giua;
                        cuoi:=giua - 1;
                end
                else dau:=giua + 1;
        until dau > cuoi;
end;
{}
procedure xuat;
begin
        assign(f,fo); rewrite(f);
        writeln(f,ans);
        close(f);
end;
{}
begin
        docf;
        lam;
        xuat;
end.