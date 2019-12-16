const
 fi = 'region.inp'; fo = 'region.out';

type
 kn = 1..100000;
 kthisinh = record
  id, reg, sc, med: longint;
 end;
var
 n,m,r,diemsan, tz: longint;
 free: array[kn] of boolean;

 diem, iid: array[kn] of longint; //diem[i] = diem cao nhat cua nguoi vung i.
 //iid[i] = so thu tu (id) cua nguoi diem cao nhat.
 vung: array[kn] of boolean; //vung[i] = false : vung i da co nguoi duoc chon roi.

 a: array[kn] of kthisinh;
 regr : array[kn] of longint; //regr[i] = vung cua thi sinh thu tu id.


procedure Doc ();
var i, id_, reg_, sc_, med_ : longint;
begin
 fillchar(free, sizeof(free), true); filldword(diem, sizeof(diem) div 4, DWord(-1)); fillchar(vung, sizeof(vung), true);
 readln(n,m,r);
 for i:=1 to n do
  begin
   readln(a[i].id, a[i].reg, a[i].sc, a[i].med); regr[a[i].id] := a[i].reg;

   if (a[i].med = 1) then begin free[a[i].id] := false; dec(m); vung[a[i].reg] := false; end; //Thang nay co suat vo, suong vl.
   if a[i].sc > diem[a[i].reg] then
    begin
     diem[a[i].reg] := a[i].sc;
     iid[a[i].reg] := a[i].id;
    end;
  end;
end;


procedure SapXep ();
var x: longint; y: kthisinh;

 procedure SX(const l, r: longint);
 var i, j: longint;
 begin
  i:=l;j:=r;x:=a[(i+j) shr 1].sc;
  repeat
   while (a[i].sc > x) do inc(i);
   while (a[j].sc < x) do dec(j);
   if not (i>j) then
    begin
     y:=a[i];a[i]:=a[j];a[j]:=y;
     inc(i); dec(j);
    end;
  until i>j;
  if l<j then SX(l, j); if i<r then SX(i,r);
 end;

begin
 SX(1, n);
end;


procedure SanThucLuc ();
var i: longint;
begin
 for i:=1 to r do
  if (diem[i] <> -1) then
   if (free[iid[i]]) and (vung[regr[iid[i]]]) then
    begin
     free[iid[i]] := false;
     dec(m);
     vung[regr[iid[i]]]:=false;
    end;
end;


procedure XuLy (var zen: longint);
var i: longint;
begin
 for i:=1 to n do
  begin
  zen := i;
  if free[a[i].id] then
   begin
    free[a[i].id] := false;
    dec(m);
    if (m=-1) then exit();
   end;
  end;
end;


procedure Xuat ();
begin
 diemsan := a[tz].sc + 1;
 writeln(diemsan);
end;


begin
 assign(input, fi); reset(input); assign(output, fo); rewrite(output);
 Doc ();
 SanThucLuc ();
 SapXep ();
 XuLy (tz);
 Xuat ();
 close(input); close(output);
end.
