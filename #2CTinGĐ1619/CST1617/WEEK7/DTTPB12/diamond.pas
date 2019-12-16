const
     fi='diamond.inp';
     fo='diamond.out';
     maxn=50;
     maxm=200;
type sizem=0..maxm;
     sizen=1..maxn;
     sizes=1..100;
     arrm=array[sizem] of byte;
     arrn=array[sizen] of byte;

var  a,b:arrm;//a chua cach can tim duoc, b chua cach can can tim thu tu
     c:arrn;//c[j]<=maxm, trong luong cua loai qua can j
     s,ss:arrn;//ss[j]<=100, so luong qua can loai j con duoc phep su dung

     x,z:array[sizem,sizen,sizes] of int64;
       //x[i,j,l]=so cach pt so i thanh tong, bat dau boi dung l so hang c[j],
       //cac so hang con lai gom ko qua s[jj] qua can loai jj, jj=j+1..n

       //z[i,j,l]=so cach pt so i thanh tong, bat dau boi ko qua l so hang c[j],
       //cac so hang con lai gom ko qua s[jj] qua can loai jj, jj=j+1..n

     m,n:byte;
     la,lb:byte;//do dai cac mang a,b
     tt,socach:int64;
     f:text;
     test:byte;

procedure Data;
var  i:byte;
begin
 assign(f,fi);reset(f);
 readln(f,m);
 readln(f,n);
 for i:=1 to n do readln(f,c[i],s[i]);
 readln(f,tt);
 lb:=0;
 while not seekeoln(f) do
  begin
   inc(lb);read(f,b[lb]);
  end;
 close(f);
end;

procedure Init(m,n:byte);
var  i,j,l,jj,ll:byte;
begin
 //XD mang X, de tinh so cach can - Dong 1
 fillchar(x,sizeof(x),0);
 for i:=2 to m do
  for j:=n downto 1 do if i>=c[j] then
   for l:=1 to s[j] do
    begin
     if i<l*c[j] then break;
     if i=l*c[j] then x[i,j,l]:=1 else
      begin
       x[i,j,l]:=0;
       for jj:=j+1 to n do
       for ll:=1 to s[jj] do
        begin
         if i-l*c[j]<ll*c[jj] then break;
         x[i,j,l]:=x[i,j,l]+x[i-l*c[j],jj,ll];
        end;
      end;
    end;

 //XD mang z, phuc vu cho tim 2 dong sau
 //z[i,j,l]=so cach ptich i thanh tong <= l so hang c[j],
 //cac so hang con lai > c[j], neu co
 fillchar(z,sizeof(z),0);
 for i:=2 to m do
  for j:=1 to n do
   for l:=1 to s[j] do
     for ll:=1 to l do z[i,j,l]:=z[i,j,l]+x[i,j,ll];
end;


procedure TimSoCach(m,n:byte);//Tim so cach - Dong 1
var  j,l:byte;
begin
  socach:=0;
  for j:=1 to n do for l:=1 to s[j] do socach:=socach+x[m,j,l];
end;


procedure TimCach(m,n:byte;tt:int64);//Tim mang a - Cach can - Dong 2
var  i,j,t:byte;
begin
 ss:=s;
 t:=0;
 i:=m;
 j:=1;
 repeat
   while tt>z[i,j,ss[j]] do
    begin tt:=tt-z[i,j,ss[j]];inc(j);
    end;
   inc(t);a[t]:=c[j];
   if tt=0 then break;
   i:=i-a[t];
   dec(ss[j]);
 until i=0;
 la:=t;
end;

procedure TimSTT(m,n:byte);//Tim so thu tu - Dong 3
var i,j,t:byte;
begin
 ss:=s;
 tt:=1;
 i:=m;
 j:=1;
 for t:=1 to lb do
  begin
   while c[j]<b[t] do
    begin
     tt:=tt+z[i,j,ss[j]];inc(j);
    end;
   i:=i-b[t];
   dec(ss[j]);
  end;
end;


procedure solution;
var i:byte;
begin
  Data;
  Init(m,n);
  assign(f,fo); rewrite(f);
  TimSoCach(m,n);
  writeln(f,socach);
  TimCach(m,n,tt);
  for i:=1 to la do write(f,a[i],' ');writeln(f);
  TimSTT(m,n);
  writeln(f,tt);
  close(f);
end;

begin
 solution
end.
