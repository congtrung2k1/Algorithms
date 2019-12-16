//By Ngo Duc Minh - QHD 2 lan, tiet kiem bo nho
const fi='Inps\organ.i';
      fo='Outs\organ.o';
      nmax=200;

type size=0..nmax;

var n,s,w,m:byte;
    nf,wf:byte;//nf=max tat ca n trong file;wf=max w trong file
    h:array[size] of longint;
    a:array[size,size] of string;
    b0,b1:array[size] of string;
    bmin,bmax:longint;
    f,g:text;
    test:byte;
    ans:string;

{---------------------------}
function cong(x,y:string):string;
var nho:byte;
    i:integer;
begin
 while length(x)<length(y) do x:='0'+x;
 while length(y)<length(x) do y:='0'+y;
 nho:=0;
 for i:=length(x) downto 1 do
  begin
   nho:=nho+ord(x[i])+ord(y[i])-96;
   x[i]:=chr(48+nho mod 10);
   nho:=nho div 10;
  end;
 if nho=1 then x:='1'+x;
 exit(x);
end;
{---------------------------}
function nhan(k:byte;x:string):string;
var i,nho:integer;
    xx:string;
begin
 nho:=0;
 for i:=length(x) downto 1 do
  begin
   nho:=nho+k*(ord(x[i])-48);
   x[i]:=chr(48+nho mod 10);
   nho:=nho div 10;
  end;
 if nho>0 then
  begin
   str(nho,xx);x:=xx+x;
  end;
 exit(x);
end;
{---------------------------}
function lonhon(x,y:string):boolean;
begin
 if length(x)=length(y) then exit(x>y)
 else exit(length(x)>length(y));
end;

{---------------------------
Dat a[w,j]=so hoan vi cua 1,2,...j co w nghich the (w=0...,j=1...)
The thi: . a[w,j]=0, neu j<=w
         . a[0,j]=1, voi moi j
         . a[w,w+1]=1
         . a[w,j]=(w+1)*a[w,j-1] (so ngt do dat j xen giua moi ngt da co va dat j vao cuoi day)
                  +(j-w)*a[w-1,j-1] (i-w=(j-1)- (so khe xen giua day j-1 phan tu va 1 khe dung truoc day
                                         (w-1)  (so khe giua w-1 ngt da co
                                        =so cach chen j vao day de lam tang them 1 ngt
                  neu j=w+2..n

Con neu dat a[w,j]=so hoan vi cua 1..j co khong qua w ngt thi


----------------------------}
procedure init;
var w,j:byte;
begin
 for j:=1 to nf do a[0,j]:='1';
 for w:=1 to wf do
  begin
   for j:=1 to w do a[w,j]:='0';
   a[w,w+1]:='1';
   for j:=w+2 to nf do a[w,j]:=cong(nhan(w+1,a[w,j-1]),nhan(j-w,a[w-1,j-1]));
  end;

 for j:=1 to nf do
  for w:=1 to wf do a[w,j]:=cong(a[w,j],a[w-1,j]);
end;

{---------------------------
Dat b[s,n]=so loai dan lon nhat thu duoc, ta tinh b[i,j] voi i=1..s,j=1..n
. Voi moi lo h1,...hj, neu thoa man bmin<=h1+...+hj<=bmax thi b[1,j]=a[w,j], trai lai thi b[1,j]=0
. Voi moi i=2..s, ta co:
  b[i-1,i-1]=i-1
  Voi j=i..n:
    b[i,j]=0 neu hi+...+hj khong thoa man dk bmin, bmax, trai lai thi
    b[i,j]=max(b[i-1,k-1]+a[w,j-k+1]) voi moi hi+...+hj thoa man k=i..j

---------------------------}

procedure process;
var i,j,k:byte;
    ss:int64;
    tmp:string;
begin
 ss:=0;
 for j:=1 to n do
  begin
   ss:=ss+h[j]*m;
   if (ss>=bmin)and(ss<=bmax) then b0[j]:=a[w,j] else b0[j]:='0';
  end;

 for i:=2 to s do
  begin
   str(i-1,tmp);
   b0[i-1]:=tmp;
   for j:=1 to i-1 do
    if (h[j]*m<bmin)or(h[j]*m>bmax) then
     begin
      b0[i-1]:='0';break;
     end;
   for j:=i to n do
    begin
     ss:=0;
     b1[j]:='0';
     for k:=j downto i do
      begin
       ss:=ss+h[k]*m;
       if (ss>=bmin)and(ss<=bmax) then
        begin
         tmp:=cong(b0[k-1],a[w,j-k+1]);
         if lonhon(tmp,b1[j]) then b1[j]:=tmp;
        end;
      end;
   end;
   b0:=b1;
  end;
  ans:=b0[n];
end;

{---------------------------}
procedure solution;
var i,j,t:byte;
begin
 writeln('Test ',test,':');
 assign(f,fi+chr(48+test));reset(f);
 readln(f,t);
 nf:=0;
 wf:=0;
 for i:=1 to t do
  begin
   readln(f,n,w,w);readln(f);
   if w>n-1 then w:=n-1;
   if n>nf then nf:=n;
   if w>wf then wf:=w;
  end;
 reset(f);

 init;

 assign(g,fo+chr(48+test));rewrite(g);
 readln(f,t);
 for i:=1 to t do
  begin
   readln(f,n,s,w,m,bmin,bmax);
   for j:=1 to n do read(f,h[j]);
   readln(f);
   process;
   writeln(g,ans);
  end;
 close(f);close(g);
end;

//-----------------------------
begin
 for test:=0 to 9 do solution
 nd.
