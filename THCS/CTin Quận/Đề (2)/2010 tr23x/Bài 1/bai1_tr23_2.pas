program bai1_tr23_2;
var fi,fo:text;
    t,i,n:longint;

    procedure np(n:longint);
      var chuoi,zz: string; i,z:longint;
      begin
       chuoi:=''; i:=-1;
       while n<>0 do
         begin
          z:=n mod 2;
          str(z,zz);
          chuoi:=zz+chuoi;
          inc(i); if zz='1' then write (fo,i,' ');
          n:=n div 2;
         end;
       writeln(fo);
      end;


BEGIN
assign (fi,'NHIPHAN.INP'); reset(fi);
assign (fo,'NHIPHAN.OUT'); rewrite(fo);
read (fi,t);
for i:=1 to t do
  begin
   read(fi,n);
   np(n);
  end;
close(fi); close(fo);
END.