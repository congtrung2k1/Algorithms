program bai2_tr15_2;
var fi,fo: text;
    n,s,m,dem,dso,cs: longint;


    function dx(vao:string): boolean;
      var c: string; i: longint;
      begin
        c:='';
        for i:=1 to length(vao) do c:=vao[i]+c;
        if c=vao then dx:=true else dx:=false;
      end;

    procedure doi(m:longint; cs:LONGINT);
      var chuoi,zz: string;
          z: longint;
      begin
       chuoi:='';        
       z:=m mod cs;
       while m>0 do
         begin
          z:=m mod cs;
          str(z,zz);
          chuoi:=zz+chuoi;
          m:=m div cs;
         end;
       if dx(chuoi)=true then inc(dso);
      end;


BEGIN
assign (fi,'DUALPAL.IN'); reset(fi);
assign (fo,'DUALPAL.OUT'); rewrite(fo);
read(fi,n,s);

m:=s; dem:=0;
while dem<n do
  begin
   inc(m); dso:=0;
   for cs:=2 to 10 do
     begin
      doi(m,cs);
      if dso=2 then
        begin
         inc(dem);
         writeln (fo,m);
         break
        end;
     end;
  end;

close(fi); close(fo);
END.