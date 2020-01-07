Uses	math;
Const
		maxn		=		trunc(2e3) + 9;
		maxc		=		trunc(3e4) + 9;
Type
		canh		=		record		d, c : longint; 	end;
Var
		list : array[0..maxc] of canh;
		next : array[0..maxc] of longint;
		head, low, num, tplt, stack, scv, scr, goc : array[0..maxn] of longint;
		xoa : array[0..maxn] of boolean;
		n, i, j, st, time, lt, m, dr, dv : longint;
procedure	dfs_tarjan(u : longint);
	var
		v, vt : longint;
	begin
		inc(st); stack[st] := u;
		inc(time); num[u] := time; low[u] := time;
		vt := head[u];
		while vt <> 0 do
		begin
			v := list[vt].c;
			if not xoa[v] then
			begin
				if num[v] = 0 then
				begin
					dfs_tarjan(v);
					low[u] := min(low[u], low[v]);
				end else low[u] := min(low[u], num[v]);
			end;
			vt := next[vt];
		end;
		if num[u] <> low[u] then exit;
		inc(lt); goc[lt] := u;
		repeat
			v := stack[st]; dec(st);
			xoa[v] := true;
			tplt[v] := lt;
		until	u = v;
	end;
procedure	process;
	begin
		readln(n, m);
		fillchar(head, sizeof(head), 0); num := head; low := num; tplt := head; scv := head; scr := scv;
		for i := 1 to m do
		begin
			readln(list[i].d, list[i].c);
			next[i] := head[list[i].d]; head[list[i].d] := i;
		end;
		time := 0; st := 0; lt := 0;
		for i := 1 to n do if num[i] = 0 then dfs_tarjan(i);
		for i := 1 to m do
			if tplt[list[i].d] <> tplt[list[i].c] then
			begin
				inc(scr[tplt[list[i].d]]); inc(scv[tplt[list[i].c]]);
			end;
		dr := 0; dv := 0;
		for i := 1 to lt do begin if scv[i] = 0 then inc(dv); if scr[i] = 0 then inc(dr); end;
		if (dv = 1) and (dr = 1) then
		begin
			writeln('YES');
			for i := 1 to lt do if scr[i] = 0 then	begin	write(goc[i],' ');	break;	end;
			for i := 1 to lt do if scv[i] = 0 then	begin 	write(goc[i]	);	break;	end;
			exit;
		end;
		writeln('NO');
	end;
BEGIN
		process;
END.