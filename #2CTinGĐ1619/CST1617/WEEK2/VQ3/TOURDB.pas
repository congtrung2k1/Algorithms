const
  FileInp  = 'TOURDB.inp';
  FileOut = 'TOURDB.out';
  max = 2501;
var
  fi,fo:text;
  a: array[1..max, 1..max] of Boolean;
  Number, Low, Parent: array[1..max] of Longint;
  n, Count: Longint;

procedure Enter;
var
  i, m, u, v: Longint;
begin
  ReadLn(fi, n, m);
  for i := 1 to m do
    begin
      ReadLn(fi, u, v);
      a[u, v] := True;
      a[v, u] := True;
    end;
end;

procedure Visit(u:Longint);
var v:Longint;
begin
Inc(Count); Number[u] := Count;
Low[u] := n + 1;
for v := 1 to n do
	if a[u, v] then
	begin
		a[v, u] := False;
		if Parent[v] = 0 then
		begin
			Parent[v] := u;
			Visit(v);
			if Low[u] > Low[v] then Low[u] := Low[v];
		end
		else
			if Low[u] > Number[v] then Low[u] := Number[v];
	end;
end;

procedure Solve;
var
u, v: Longint;
begin
	Count := 0;
	FillChar(Parent, SizeOf(Parent), 0);
	for u := 1 to n do
		if Parent[u] = 0 then
		begin
			Parent[u] := -1;
			Visit(u);
		end;
end;

procedure PrintResult;
var
	u, v, tmp: Longint;
	nChildren: array[1..max] of Longint;
	IsArticulation: array[1..max] of Boolean;
        ans:Longint;
begin
 for v := 1 to n do
 begin
 u := Parent[v];
 if (u <> -1) and (Low[v] >= Number[v]) then
  begin a[u,v]:=false; a[v,u]:= false; end;
 end;
 For u:=1 to n do begin
  tmp:=0;
  For v:=1 to n do
  if (a[u,v]=false) and (u<>v) then inc(tmp);
  if tmp=n-1 then inc(ans);
  end;
 Writeln(fo,n-ans);
end;

BEGIN
  Assign(fi,fileinp);Reset(fi);
  Assign(fo,fileout); Rewrite(fo);
  Enter;
  Solve;
  PrintResult;
  Close(fi); Close(fo);
END.


