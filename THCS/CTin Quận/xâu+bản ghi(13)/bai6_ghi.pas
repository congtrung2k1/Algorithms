program bai6_trang14;
uses crt;
type t_t= record
         ht: string[30];
         ns : string[10];
         dt,dv,da,dtb: extended;
        end;
var sl: array [1..100] of t_t;
    diem: array [1..100] of extended;
    g1: t_t;
    i,n,j: longint; g: extended;
begin
writeln ('nhap si so'); readln(n); writeln;

for i:= 1 to n do
 with sl[i] do
   begin
    clrscr;
    writeln ('nhap thong tin');
    writeln ('nhap ten: '); readln(ht);
    writeln ('nhap ngay sinh: '); readln(ns);
    writeln ('nhap diem theo thu tu toan, van ,anh: '); readln (dt,dv,da);
    dtb:= (dt+dv+da)/3;
    diem[i]:=dtb;
   end;
for i:=1 to n-1 do
 for j:= i+1 to n do
  if diem[i]>diem[j] then
   begin
     g:=diem[i]; diem[i]:=diem[j]; diem[j]:=g;
     g1:=sl[i]; sl[i]:=sl[j]; sl[j]:=g1;
   end;

clrscr;
for i:= 1 to n do
 begin
   with sl[i] do
    begin
      writeln;
      writeln('ho va ten: ',ht);
      writeln('ngay sinh: ',ns);
      writeln('diem trung binh: ',dtb:1:1);
      write  ('xep loai: ');
      if dtb<2 then write('yeu');
      if (dtb>=2) and (dtb<6.5) then write('trung binh');
      if (dtb>=6.5) and (dtb<8.5) then write('kha');
      if dtb>=8.5 then write('gioi');
      writeln;
    end;
 end;
readln
end.