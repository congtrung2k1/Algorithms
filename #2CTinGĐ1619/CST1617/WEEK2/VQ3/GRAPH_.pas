{Xac dinh cau khop cua do thi vo huong}
const
  FileInp  = 'caukhop.inp';
  FileOut = 'caukhop.out';
  max = 10000;
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

procedure Visit(u:Longint); {Duyet DFS, dinh chieu, danh so}
var
v:Longint;
begin
Inc(Count); Number[u] := Count; {Truoc het danh so u}
Low[u] := n + 1; {Khoi gian Low[u] = oo}
for v := 1 to n do
	if a[u, v] then {Xet v ke u}
	begin
		a[v, u] := False; {Bo di cung (v, u)}
		if Parent[v] = 0 then {Parent[v] = 0 tuong ung v chua tham, (u, v) la cung thuoc cay DFS}
		begin
			Parent[v] := u;
			Visit(v); {Tham v}
			if Low[u] > Low[v] then Low[u] := Low[v]; {Cuc tieu hoa Low[u] theo Low[v]}
		end
		else {v da tham, (u, v) la cung nguoc}
			if Low[u] > Number[v] then Low[u] := Number[v]; {Cuc tieu hoa Low[u] theo Number[v]}
	end;
end;

procedure Solve;
var
u, v: Longint;
begin
	Count := 0;
	{Danh dau moi dinh deu chua tham}
	FillChar(Parent, SizeOf(Parent), 0);
	for u := 1 to n do
		if Parent[u] = 0 then {Gap mot dinh chua tham}
		begin
			Parent[u] := -1; {Cho u la mot goc cay DFS}
			Visit(u); {Xay dung cay DFS goc u}
		end;
end;

procedure PrintResult; //In ket qua
var
	u, v: Longint;
	nChildren: array[1..max] of Longint; {Tinh nChildren[u] = So nhanh con cua nhanh DFS goc u}
	IsArticulation: array[1..max] of Boolean; //Xac dinh co phai la khop khong
        kq1,kq2:Longint;
begin
	//WriteLn(fo,'Bridges: '); //Liet ke cac cau
        kq1:=0;kq2:=0;
	for v := 1 to n do
	begin
		u := Parent[v];
		if (u <> -1) and (Low[v] >= Number[v]) then inc(kq1);
			//WriteLn(fo,'(', u, ', ', v, ')');
	end;
	//WriteLn(fo,'Articulations:'); //Liet ke cac khop
	FillChar(nChildren, SizeOf(nChildren), 0);
	//Tinh so nhanh con cua moi dinh thuoc do thi sau khi dinh chieu DFS
	for v := 1 to n do
	begin
		u := Parent[v];
		if u <> -1 then Inc(nChildren[u]);
	end;
	{Do thi vo huong ban dau co nhieu thanh phan lien thong, tuong ung khi dinh chieu DFS
	tao ra do thi co huong voi nhieu cay DFS, moi cay DFS co mot goc}
	//u la khop neu u la goc cay DFS va u co it nhat 2 nhanh con
	for u := 1 to n do
		IsArticulation[u]:=(Parent[u] = -1) and (nChildren[u]>= 2);
	//u la khop neu u KHONG LA GOC CAY DFS va low[v]>=Number[u]
	for v := 1 to n do
	begin
		u := Parent[v];
		if (u <> -1) and (Parent[u] <> -1) then //Xet cac cung (u,v) voi u khong phai la goc cay DFS
			if (Low[v] >= Number[u]) then //Neu thoa dieu kien
				IsArticulation[u] := True; //Danh dau dinh u la khop
	end;
	for u := 1 to n do //Liet ke cac khop cua do thi
		if IsArticulation[u] then inc(kq2);//WriteLn(fo,u);
        Writeln(fo,kq2,#32,kq1);
end;

{Chuong trinh chinh}
BEGIN
  Assign(fi,fileinp);Reset(fi);
  Assign(fo,fileout); Rewrite(fo);
  Enter;
  Solve;
  PrintResult;
  Close(fi); Close(fo);
END.


