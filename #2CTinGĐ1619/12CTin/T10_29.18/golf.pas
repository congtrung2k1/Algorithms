uses math;
const oo = 1000000000;
var a,b: array [1..500,1..500] of longint;
    ans,n,m,i,j,l,r,mid,x,y,dem: longint;
    xx: array [1..4] of integer=(1,-1,0,0);
    yy: array [1..4] of integer=(0,0,1,-1);

function inn(x,y,m,n: longint): boolean;
begin
	if (0 < x) and (x <= m) and (0 < y) and (y <= n) then exit(true) else exit(false);
end;

function check(k: longint): boolean;
var q,w: array [1..2501] of longint;
    fre: array [1..500,1..500] of boolean;
    fi,re,cnt,u,v,i,j: longint;
begin
	for i:=1 to m do for j:=1 to n do fre[i][j]:=false;
	re:=1;
	fi:=1;
	cnt:=dem;
	dec(cnt);
	q[re]:=x; w[re]:=y;
	while fi <= re do begin
		u:=q[fi]; v:=w[fi]; inc(fi);
		for i:=1 to 4 do
			if inn(u + xx[i], v + yy[i], m, n)
                        and not fre[u + xx[i]][v + yy[i]]
                        and (abs(a[u][v] - a[u + xx[i]][v + yy[i]]) <= k) then
                        begin
				fre[u + xx[i]][v + yy[i]]:=true;
				inc(re);
				q[re]:=u + xx[i];
				w[re]:=v + yy[i];
				if (b[u + xx[i]][v + yy[i]] = 1) then dec(cnt);
				if (cnt = 0) then exit(true);
			end;
	end;
	if cnt > 0 then exit(false);
end;

BEGIN
	assign(input,'golf.inp'); reset(input);
	assign(output,'golf.out'); rewrite(output);

        read(m,n);
        for i:=1 to m do for j:=1 to n do read(a[i][j]);
        for i:=1 to m do for j:=1 to n do begin
                read(b[i][j]);
                if b[i][j] = 1 then begin
                        inc(dem);
                        x:=i; y:=j;
                end;
        end;

        l:=0; r:=oo;
        while l <= r do begin
        	mid:=(l + r) div 2;
        	if check(mid) then begin
        		ans:=mid; r := mid - 1
        	end
        	else l := mid + 1;
        end;

        writeln(ans);
END.

