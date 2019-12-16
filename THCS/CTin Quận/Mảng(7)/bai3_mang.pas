program bai3_trang7;
uses crt;
var A: array [1..99] of longint;
    i,k,n,s,t,c,tnt: longint;
begin
clrscr;
writeln ('nhap so phan tu'); readln (n); writeln;
writeln ('nhap phan tu');
for i:= 1 to n do
  begin
   write ('A[',i,']= '); readln (A[i]);
  end;

writeln ('Cac phan tu cua mang la:');
for i:= 1 to n do writeln (A[i]);

writeln ('cac phan tu chan la:');
for i:= 1 to n do
  if (A[i] mod 2=0) and (A[i]>0) then
   begin
    s:=s+A[i]; writeln(A[i]);
   end;
writeln('tong: ',s);

writeln ('cac phan tu le la:');
for i:= 1 to n do
  if (A[i] mod 2<>0) and (A[i]>0) then
   begin
    t:=t+A[i]; writeln(A[i]);
   end;
writeln('tong: ',t);

writeln('Cac so nguyen to: ');
  if A[i]<=1 then s:=s+0 else
    begin
       k:=2;
       while A[i] mod k<>0 do inc(k);
       if k=A[i] then
        begin
         writeln (A[i]); tnt:=tnt+A[i];
        end;
    end;
writeln ('tong la: ',tnt);

writeln ('cac phan tu am la:');
for i:= 1 to n do
  if A[i]<0 then
    begin
      writeln (A[i]); c:=c+A[i];
    end;
writeln('tong: ',c);

readln
end.
