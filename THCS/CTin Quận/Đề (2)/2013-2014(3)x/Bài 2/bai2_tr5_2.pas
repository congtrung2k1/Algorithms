program bai2_tr5_2013_2014;
var fi,fo: text;
    t,n,i,d: longint;
    chuoi: string;
    A: array [1..6] of byte;

    procedure bgt(so:longint);
      var ss:string;
      begin
       ss:='ABCDEF';
       so:=so-9;
       if A[so]=0 then inc(d);
       inc(A[so]);
       chuoi:=ss[so]+chuoi;
      end;

    procedure doics(n:longint);
      var x:longint;
          xx:string;
      begin
       d:=0; chuoi:='';
       while n>0 do
         begin
           x:=n mod 16;
           if x<10 then
             begin
              str (x,xx);
              chuoi:=xx+chuoi;
             end else bgt(x);
           n:= n div 16;
         end;
      end;



BEGIN
assign (fi,'COSO16.INP'); reset(fi);
assign (fo,'COSO16.OUT'); rewrite(fo);
read(fi,t);

for i:=1 to t do
  begin
    for d:=1 to 6 do A[d]:=0;
    read(fi,n);
    doics(n);
    writeln(fo,chuoi,'  ',d);
  end;

close(fi); close(fo);
END.
