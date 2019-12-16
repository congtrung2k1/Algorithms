const   fi='Tracks.inp';
        fo='Tracks.out';
        ai:array [1..4] of longint=(1,0,-1,0);
        aj:array [1..4] of longint=(0,1,0,-1);
var     n,h,w,l,r:longint;
        A:array [0..4001,0..4001] of char;
        Qi,Qj,Qk:array [1..10000000] of longint;
        Visit:array [0..4001,0..4001] of boolean;
procedure nhap;
var     i,j:longint;
begin
        assign(input,fi);reset(input);
        readln(h,w);
        for i:=1 to h do
        begin
                for j:=1 to w do read(A[i,j]);
                readln;
        end;
end;
procedure push(i,j,k:longint);
begin
        inc(r);Qi[r]:=i;Qj[r]:=j;Qk[r]:=k;
end;
procedure pop(var i,j,k:longint);
begin
        inc(l);i:=Qi[l];j:=Qj[l];k:=Qk[l];
end;
procedure Loang(i,j,k:longint);
var     u:byte;ii,jj:longint;
begin
        Visit[i,j]:=True;
        for u:=1 to 4 do
        begin
                ii:=i+ai[u];jj:=j+aj[u];
                if Visit[ii,jj] then continue;
                if A[i,j]=A[ii,jj] then Loang(ii,jj,k) else
                if A[ii,jj] in ['F','R'] then push(ii,jj,k+1);
        end;
end;
procedure xuat;
var     i,j,k,kq:longint;
begin
        assign(output,fo);rewrite(output);
        kq:=0;l:=0;r:=0;
        push(1,1,1);
        while l<r do
        begin
                pop(i,j,k);
                if k>kq then kq:=k;
                if visit[i,j] then continue;
                loang(i,j,k);
        end;
        writeln(kq);
end;
begin
        nhap;
        xuat;
end.
