program bai1_2010_2011_LA_tr2;
uses crt;
var fi,fo: text;
    kt: boolean;
    n,i,m,z: longint;

    function cp(n:longint): boolean;
      begin
       if sqrt(n)= trunc(sqrt(n)) then cp:=true else cp:=false;
      end;

begin
assign (fi,'input.dat'); reset(fi);
assign (fo,'output.dat'); rewrite(fo);

read(fi,n);
writeln(fo,n,' so chinh phuong dau tien:');
for i:=1 to n do writeln (fo,i*i);

read(fi,m); z:=m;
while sqrt(z) <> trunc(sqrt(z)) then inc(z);

close(fi); close(fo);
end.