const fi='BSEQ.INP';
      fo='BSEQ.OUT';
var f,g:text;
    s:array[1..15] of char;
    KT:array['A'..'O'] of boolean;
    a:array[1..15] of string[15];
    full:string;
    n:integer;
    kq,notans:qword;
function KiemTra(i:integer;z:char):boolean;
var j:integer;
begin
        for j:=1 to i-1 do if s[j]=z then exit(false);
        for j:=1 to i-1 do if abs(ord(z)-ord(s[j]))=i-j then exit(false);
        if i>1 then if abs(ord(z)-ord(s[i-1]))=2 then exit(false);
        if i>2 then if abs(ord(z)-ord(s[i-2]))=1 then exit(false);
        exit(true);
end;
procedure Try(i:longint);
var j:integer;
begin
        for j:=1 to length(a[i]) do
        begin
                if KiemTra(i,a[i][j]) then
                begin
                        s[i]:=a[i][j];
                        if i<n then Try(i+1) else inc(notans);
                end;
        end;
end;
procedure Doc;
var i,j:longint;
    c:char;
begin
        assign(f,fi);
        reset(f);
        assign(g,fo);
        rewrite(g);
        while not(seekeof(f)) do
        begin
                readln(f,n);
                if n=0 then break;
                kq:=1;
                for i:=1 to n do
                begin
                        for c:='A' to 'O' do kt[c]:=true;
                        readln(f,a[i]);
                        full:='';
                        for j:=1 to length(a[i]) do
                        begin
                                if a[i][j]='?' then
                                begin
                                        for c:='A' to chr(64+n) do full:=full+c;
                                        break;
                                end;
                                if kt[a[i][j]]=true then
                                begin
                                        full:=full+a[i][j];
                                        kt[a[i][j]]:=false;
                                end;
                        end;
                        a[i]:=full;
                        kq:=kq*length(a[i]);
                end;
                notans:=0;
                for i:=1 to length(a[1]) do
                begin
                        s[1]:=a[1][i];
                        Try(2);
                end;
                writeln(g,kq-notans);
        end;
        close(f);
        close(g);
end;
begin
        Doc;
end.