const
   fi = 'region.inp';
   fo = 'region.out';
   maxN = trunc(1e5);

type
   kn = 1..maxN;
   THocSinh = record
      id,reg,scI,preM : longint;
      {
         id   : index          : STT
         reg  : region         : vung ma thi sinh toi
         scI  : scoreI         : diem thi sinh vong I
         preM : previous medal : da co huy chuong lan truoc ? (0..1)
      }
   end;

var
   n,m,r:longint;
   a:array[kn] of THocSinh;

procedure sort();
var
   x,t:THocSinh;

   function cmp(x,y:ThocSinh):boolean;
   begin
      cmp := (x.preM > y.preM) or
             ((x.preM = y.preM) and (x.scI > y.scI));
   end;

   procedure qs(l,r:longint);
   var
      i,j:longint;
   begin
      if l >= r then exit();
      i := l; j := r;
      x := a[(l+r) >> 1];
      repeat
         while cmp(a[i],x) do inc(i);
         while cmp(x,a[j]) do dec(j);
         if i <= j then
         begin
            t := a[i]; a[i] := a[j]; a[j] := t;
            inc(i); dec(j);
         end;
      until i > j;
      qs(l,j); qs(i,r);
   end;

begin
   qs(1,n);
end;

procedure nhap();
begin
   read(n,m,r);
   for n := 1 to n do
      with a[n] do
         read(id,reg,scI,preM);
end;

function check(x:longint):boolean; // kt voi diem san = x , so nguoi vao dc vong trong <= m ?
var
   soNguoi,i :longint;
   bReg:array[kn] of boolean;
begin
   soNguoi := 0;
   fillchar(bReg,sizeof(bReg),false);
   for i := 1 to n do
   begin
      if a[i].preM = 1 then             // dk1 : da co huy chuong
      begin
         inc(soNguoi);
         bReg[a[i].reg] := true; // da co nguoi
      end else
         if a[i].scI >= x then          // dk2 : diem cao hon hoac bang diem san
         begin
            inc(soNguoi);
            bReg[a[i].reg] := true;
         end else
            if not bReg[a[i].reg] then  // dk3 : dia phuong nay chua co nguoi
            begin
               inc(soNguoi);
               bReg[a[i].reg] := true;
            end;
   end;
   check := soNguoi <= m;
end;

procedure xuat();
var
   lo,hi,mid,kq:longint;
begin
   sort();
   //for n := 1 to n do with a[n] do writeln(id,' ',reg,' ',scI,' ',preM);
   lo := 1; hi := trunc(1e9); kq := -1;
   while lo <= hi do
   begin
      mid := (lo + hi) >> 1;
      if check(mid) then  // neu so nguoi <= m
      begin
         kq := mid;
         hi := mid-1;   // giam diem san
      end else
         lo := mid+1;   // tang diem san
   end;
   write(kq);
end;

begin
   assign(input,fi);reset(input);
   assign(output,fo);rewrite(output);
   nhap();
   xuat();
end.