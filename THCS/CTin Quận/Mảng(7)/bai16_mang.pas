program bai16_trang12;
uses crt;
var i,j,s,m,d,k: longint;
    A: array [1..100] of longint;
begin
clrscr;
writeln ('nhap k'); readln (k); writeln;
i:=0;
    repeat
inc(i);
write('A[',i,']='); readln (A[i]);
    until A[i]=0;

s:=0; m:=0; d:=0;
for j:=1 to i do
 begin
    if A[j]<k then
     begin
      inc(d); s:=A[j]+s;
     end;
    if j>1 then
     if A[j]<A[j-1] then inc(m);
 end;
writeln ('so phan tu nho hon k= ',d,'. tong la: ',s);

writeln ('so phan tu nho hon so ben trai no la: ',m);
for j:=2 to i do
  if A[j]<A[j-1] then writeln(j,'  ',A[j]);

readln
end.