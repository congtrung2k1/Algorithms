program bai3_tr9_2;
var fi,fo: text;
    i,j,n,b,dem,tong: longint;
    kt: boolean;
    A: array [1..20000] of longint;

    procedure tinh(dem:longint);
      begin
        for i:=1 to n do
          begin
           tong:=0;
           for j:=i to i+dem-1 do tong:=tong+A[j];
           if tong>b then
             begin
              kt:=true;
              exit;
             end;
          end;
      end;

BEGIN
assign (fi,'TONGSO.INP'); reset(fi);
assign (fo,'TONGSO.OUT'); rewrite(fo);
read (fi,n,b);

for i:=1 to n do read(fi,A[i]);

dem:=0;
kt:=false;
while kt=false do
  begin
    inc(dem);
    tinh(dem);
  end;

writeln (fo,dem);

close(fi); close(fo);
END.
