program bai7_trang14;
uses crt;
type t_t= record
         ht: string[30];
         ns: string[10];
         dt,dv,da,dtb: extended;
        end;
var ds: array [1..100] of t_t;
    diem: array [1..100] of extended;
    g1: t_t;
    i,n,j: longint;
    g: extended;
    trl: string;

begin
n:=0;
    repeat
clrscr;
inc(n);
with ds[n] do
 begin
   writeln ('stt: ',n);
   writeln ('nhap ten: '); readln(ht);
   writeln ('nhap ngay sinh: '); readln(ns);
       repeat
   writeln ('nhap diem theo thu tu toan, van ,anh: '); readln (dt,dv,da);
       until (dt>-1) and (dt<11) and (dv>-1)
         and (da>-1) and (da<11) and (dv<11);
   dtb:= (dt+dv+da)/3;
   diem[n]:=dtb;
   writeln ('Tiep tuc?'); readln(trl);
 end;
    until (upcase(trl)='K') or (upcase(trl)='k');

for i:=1 to n-1 do
 for j:= i+1 to n do
  if diem[i]<diem[j] then
   begin
     g:=diem[i]; diem[i]:=diem[j]; diem[j]:=g;
     g1:=ds[i]; ds[i]:=ds[j]; ds[j]:=g1;
   end;

clrscr;
for i:= 1 to n do
 begin
   with ds[i] do
    begin
      writeln;
      writeln('ho va ten: ',ht);
      writeln('ngay sinh: ',ns);
      writeln('diem trung binh: ',dtb:1:1);
      write  ('xep loai: ');
      if dtb<2 then write('yeu');
      if (dtb>=2) and (dtb<6.5) then write('trung binh');
      if (dtb>=6.5) and (dtb<8) then write('kha');
      if dtb>=8 then write('gioi');
      writeln;
    end;
 end;


writeln('danh sach HSG');
i:=1;
while diem[i]>=8 do
 begin
   writeln(ds[i].ht);
   inc(i);
 end;

readln
end.
