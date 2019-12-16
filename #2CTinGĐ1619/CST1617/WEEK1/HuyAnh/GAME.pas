// Nguyen Huy Anh

const fi='GAME.INP';
      fo='GAME.OUT';
type t=array[0..250] of longint;
var f,g:text;
    n,m,kk:integer;
    d:array[0..250,0..250] of t;
    front,back:longint;
    qm,qn,qk:array[1..15625001] of integer;

procedure Doc;
var x,y,z:integer;
begin
        assign(f,fi);
        reset(f);
        readln(f,n,m,kk);
        for x:=0 to n do
        for y:=0 to m do
        for z:=0 to kk do d[x,y,z]:=0;
        close(f);
end;
procedure Ghi(x,y,z:integer);
begin
        assign(g,fo);
        rewrite(g);
        writeln(g,d[x,y,z]);
        close(g);
        halt;
end;
procedure BFS;
var i,j,k:integer;
begin
        front:=1;
        back:=1;
        qn[1]:=n;
        qm[1]:=m;
        qk[1]:=kk;
        d[n,m,kk]:=0;
        repeat
                i:=qn[front];
                j:=qm[front];
                k:=qk[front];
                inc(front);
                if (i=j) and (j=k) then Ghi(i,j,k);
                if (i>j) and (d[i-j,j,k]=0) then
                begin
                        inc(back);
                        qn[back]:=i-j;
                        qm[back]:=j;
                        qk[back]:=k;
                        d[i-j,j,k]:=d[i,j,k]+1;
                        if (i-j=j) and (j=k) then Ghi(i-j,j,k);
                end;
                if (j>i) and (d[i,j-i,k]=0) then
                begin
                        inc(back);
                        qn[back]:=i;
                        qm[back]:=j-i;
                        qk[back]:=k;
                        d[i,j-i,k]:=d[i,j,k]+1;
                        if (i=j-i) and (i=k) then Ghi(i,j-i,k);
                end;
                if (i>k) and (d[i-k,j,k]=0) then
                begin
                        inc(back);
                        qn[back]:=i-k;
                        qm[back]:=j;
                        qk[back]:=k;
                        d[i-k,j,k]:=d[i,j,k]+1;
                        if (i-k=k) and (k=j) then Ghi(i-k,j,k);
                end;
                if (k>i) and (d[i,j,k-i]=0) then
                begin
                        inc(back);
                        qn[back]:=i;
                        qm[back]:=j;
                        qk[back]:=k-i;
                        d[i,j,k-i]:=d[i,j,k]+1;
                        if (i=k-i) and (i=j) then Ghi(i,j,k-i);
                end;
                if (k>j) and (d[i,j,k-j]=0) then
                begin
                        inc(back);
                        qn[back]:=i;
                        qm[back]:=j;
                        qk[back]:=k-j;
                        d[i,j,k-j]:=d[i,j,k]+1;
                        if (i=j) and (j=k-j) then Ghi(i,j,k-j);
                end;
                if (j>k) and (d[i,j-k,k]=0) then
                begin
                        inc(back);
                        qn[back]:=i;
                        qm[back]:=j-k;
                        qk[back]:=k;
                        d[i,j-k,k]:=d[i,j,k]+1;
                        if (j-k=k) and (k=i) then Ghi(i,j-k,k);
                end;
        until front>back;

end;
begin
        Doc;
        BFS;
end.
