program bai1_1_2;
uses crt;
var fi,fo: text;
    n,m: longint;

    function hv(chuoi:string; vma:longint):longint;
      var g:char;
      begin
       g:=chuoi[1];
       chuoi[1]:=chuoi[vma];
       chuoi[vma]:=g;
       val(chuoi,hv);
      end;

    procedure tt(n:longint);
      var chuoi: string;
          max,min: char;
          vma,vmi,i,smax,smin: longint;
      begin
       str(n,chuoi);
       max:=chuoi[1]; vma:=1;
       min:=chuoi[1]; vmi:=1;
       for i:=2 to length(chuoi) do
         begin
           if chuoi[i]>max then
             begin
              max:= chuoi[i];
              vma:=i;
             end;
           if chuoi[i]<min then
             begin
              min:=chuoi[i];
              vmi:=i;
             end;
         end;
       smax:=hv(chuoi,vma);
       smin:=hv(chuoi,vmi);
       writeln(fo, smax-smin);
      end;

begin
assign (fi,'hieu.inp'); reset (fi);
assign (fo,'hieu.out'); rewrite (fo);
read(fi,m);
if (m>1) and (m<100) then
  while not eof(fi) do
    begin
     read(fi,n);
     if (n<10000000) then tt(n);
    end;
close(fi); close(fo);
end.