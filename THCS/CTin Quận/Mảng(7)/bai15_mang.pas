program bai15_trang12;
uses crt;
var B: array [1..35] of extended;
    i,n,ct,cd: longint;
begin
clrscr;
    repeat
writeln('nhap n'); readln (n);
    until (n>=3) and (n<=35);
writeln ('nhap mang');
for i:= 1 to n do
 begin
   write('B[',i,']='); readln (B[i]);
 end;
for i:= 1 to n do write(B[i]:1:1,' '); writeln;

ct:=0;
if B[1]<B[2] then inc(ct);
for i:= 2 to n-1 do
  if (B[i]<B[i-1]) and (B[i]<B[i+1]) then inc(ct);
if B[n]<B[n-1] then inc(ct);

cd:=0;
if B[1]>B[2] then inc(cd);
for i:= 2 to n-1 do
  if (B[i]>B[i-1]) and (B[i]>B[i+1]) then inc(cd);
if B[n]>B[n-1] then inc(cd);

writeln('so luong cuc tieu dia phuong: ',ct);
writeln('so luong cuc dai dia phuong: ',cd);
readln
end.