program bai1_2010_2011_LA_tr1;
uses crt;
var n,i,j,s: longint;
    fi,fo: text;
begin
assign (fi,'input.dat'); reset(fi);
assign (fo,'output.dat'); rewrite (fo);

read(fi,n);
s:=0;
if n<3 then writeln(fo,s)
       else for i:= 2 to n-1 do
              begin
               j:=2;
               while i mod j<>0 do inc(j);
               if j=i then s:=s+i;
              end;

writeln(fo,s);
close(fi); close(fo);
end.