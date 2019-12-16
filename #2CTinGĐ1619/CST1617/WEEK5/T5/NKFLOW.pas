Const fi='NKFLOW.INP';
	fo='NKFLOW.OUT';
Type list=^node;
	node=record
		v:Integer;f,c:Longint;link:list;end;
Var a:Array[1..1000] Of list;
	n,m,u,v,s,t:Integer;
	Trace: array[1..1000] of Integer;
	ts:Longint;
	f,g:Text;
Procedure Data;
Var tmp:list;
Begin
	Assign(f,fi);Reset(f);
	Assign(g,fo);Rewrite(g);
	Readln(f,n,m,s,t);
	For n:=1 to n do a[n]:=nil;
	For m:=1 to m do
	begin
		Readln(f,u,v,ts);
		new(tmp);
		tmp^.v:=v;tmp^.c:=ts;tmp^.f:=0;tmp^.link:=a[u];a[u]:=tmp;
		new(tmp);
		tmp^.v:=u;tmp^.c:=0;tmp^.f:=0;tmp^.link:=a[v];a[v]:=tmp;
	end;
End;
Procedure incflow;
Var u,v:Integer;
	delta:longint;
	tmp:list;
Begin
	Delta:=maxlongint;
	v:=t;
	repeat;
		tmp:=a[v];
		While tmp<>nil do
			If tmp^.v=trace[v] then break
			Else tmp:=tmp^.link;
		u:=trace[v];
		tmp:=a[u];
		While tmp<>nil do
			If tmp^.v=v then break
			Else tmp:=tmp^.link;
		if (tmp^.c-tmp^.f<delta) then delta:=tmp^.c-tmp^.f;
		v:=u;
	Until v=s;
	v:=t;
	repeat
		tmp:=a[v];
		While tmp<>nil do
			If tmp^.v=trace[v] then break
			Else tmp:=tmp^.link;
		u:=trace[v];
		tmp^.f:=tmp^.f-delta;
		tmp:=a[u];
		While tmp<>nil do
			If tmp^.v=v then break
			Else tmp:=tmp^.link;
		tmp^.f:=tmp^.f+delta;
		v:=u;
	Until v=s;
End;
Function Find:Boolean;
Var u,v:Integer;
	queue:Array[1..1000] Of Integer;
	first,last:Integer;
	tmp:list;
Begin
	Fillchar(trace,sizeof(trace),0);
	first:=1;last:=1;
	queue[1]:=s;
	trace[s]:=n+1;
	Repeat
		u:=queue[first];inc(first);
		tmp:=a[u];
		While tmp<>nil do
		begin
			v:=tmp^.v;
			If(trace[v]=0) and(tmp^.c>tmp^.f) then
			begin
				trace[v]:=u;
				If(v=t) then
				begin
					find:=True;Exit;
				end;
				inc(last);queue[last]:=v;
			end;
			tmp:=tmp^.link;
		end;
	until first>last;
	Exit(False);
End;
Procedure Print;
Var u,v:Integer;
	kq,l:longint;
	tmp:list;
Begin
	u:=s;kq:=0;
	tmp:=a[u];
	While tmp<>nil do
	begin
		If tmp^.f>0 then kq:=kq+tmp^.f;
		tmp:=tmp^.link;
	end;
        Writeln(g,kq);
End;
BEGIN
	Data;
	Repeat
		If not Find then break;
		incflow;
	Until False;
	Print;
	Close(f);Close(g);
END.
