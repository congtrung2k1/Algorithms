const
        fi='courses.inp';
        fo='courses.out';
var     f,f2:text;
        st:array[1..100000] of string;
        h:array['_' .. '{'] of longint;
        t,n,ans:longint;
{}
function trung(st1,st2:string):boolean;
var     tmp:string;
        i,j:longint;
begin
        if length(st1) < length(st2) then
        begin
                tmp:=st1;
                st1:=st2;
                st2:=tmp;
        end;

        //lay 1 xau co do dai tuong duong xau nho hon
        tmp:=copy(st1,1,length(st2));

        //so sanh, neu no bang nhau thi xau nho chinh la xau lon
        if tmp=st2 then exit(true)
        else exit(false);
end;
{}
procedure qsort;

procedure sort(l,r:longint);
var     i,j,mid:longint;
        stmid,tmp:string;
        chmid:char;
begin
        i:=l; j:=r;
        mid:=(i+j) div 2;
        stmid:=st[mid];
        chmid:=st[mid][1];

        repeat
                while (length(st[i]) > length(stmid) )
                or ( (length(st[i])=length(stmid)) and (st[i][1] < chmid) )
                        do inc(i);

                while (length(st[j]) < length(stmid) )
                or ( (length(st[j])=length(stmid)) and (st[j][1] > chmid) )
                        do dec(j);

                if (i <= j ) then
                begin
                        if i<>j then
                        begin
                                tmp:=st[i];
                                st[i]:=st[j];
                                st[j]:=tmp;
                        end;
                        inc(i); dec(J);
                end;

        until i>j;

        if i<r then sort(i,r);
        if l<j then sort(l,j);
end;

begin
        sort(1,n);
end;
{}
procedure init;
var     i,j:longint;
begin
        ans:=0;

        qsort;
      //  taodanhsach;
end;
{}
procedure xuli;
var     i,j:longint;
        ch:char;
        ok:boolean;
begin
        ans:=1;
        for i:=2 to n do
        begin
                ch:=st[i][1];
                ok:=false;
                for j:=1 to i-1 do
                begin
                        if trung(st[i],st[j]) then
                        begin
                                ok:=true;
                                break;
                        end;
                end;

                if not ok then
                begin
                        inc(ans);
                end;
        end;
end;
{}
procedure docf;
var     i,j,u,v:longint;
        ch:char;
begin
        assign(f,fi); reset(f);
        assign(f2,fo); rewrite(f2);
        readln(f,t);

        for j:=1 to t do
        begin
                readln(f,n);
                for i:=1 to n do
                begin
                        st[i]:='';
                        readln(f,st[i]);
                        while (st[i] = ' ') do
                                delete(st[i],length(st),1);
                        //if (i < n) then
                        //readln(f);
                end;

                init;
                xuli;

                writeln(f2,ans);
        end;

        close(f); close(f2);
end;
{}
begin
        docf;
end.
