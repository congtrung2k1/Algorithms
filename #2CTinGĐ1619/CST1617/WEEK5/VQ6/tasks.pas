program tasks;
const fi='tasks.inp';
      fo='tasks.out';
var f:text;
    n,i,j:longint;
    a:array[1..1000,1..1000] of longint;
    p,ntrace:array[1..2000] of longint;
    trace:array[1..2000,1..1000] of longint;


procedure nhap;
begin
 assign (f,fi);
  reset (f);
  readln (f,n);
  for i:=1 to n do
  readln (f,a[1,i],a[2,i]);
 close (f);
end;

    {procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[1,(l+r) div 2];
         y1:=a[2,(l+r) div 2];
         repeat
           while (a[1,i]<x) or ( (a[1,i]=x) and (a[2,i]<y1) ) do
            inc(i);
           while (x<a[1,j]) or ( (a[1,j]=x) and (a[2,j]>y1) ) do
            dec(j);
           if not(i>j) then
             begin
                y:=a[1,i];
                a[1,i]:=a[1,j];
                a[1,j]:=y;
                y:=a[2,i];
                a[2,i]:=a[2,j];
                a[2,j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;    }

procedure xuly;
begin
 for i:=2 to 2000 do
 begin
  p[i]:=p[i-1];
  ntrace[i]:=ntrace[i-1];
  trace[i]:=trace[i-1];
  for j:=1 to n do
  if a[2,j]=i then
  begin
   if p[a[1,j]]+1 > p[i] then
   begin
    p[i]:=p[a[1,j]]+1;
    trace[i]:=trace[a[1,j]];
    ntrace[i]:=ntrace[a[1,j]]+1;
    trace[i,ntrace[i]]:=j;
   end;
  end;
 end;
end;

procedure xuatfile;
begin
 assign (f,fo);
  rewrite (f);
  writeln (f,p[2000]);
  for i:=1 to ntrace[2000] do
  writeln (f,trace[2000,i]);
 close (f);
end;

begin //main//
 nhap;
 xuly;
 xuatfile;
end.




