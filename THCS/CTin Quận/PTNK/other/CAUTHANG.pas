var fi,fo: text;
    n,dem,DemXuong,d,i,j,z,gt: longint;
    c:string;  g:char;

    procedure hv(c:string; n:longint);
      var i:byte;
      begin
        if n=1 then inc(d)
               else
          for i:=n downto 1 do
            begin
              if c[n]<>c[i] then
                begin
                  g:=c[i]; c[i]:=c[n]; c[n]:=g;  writeln(c);   readln;
                  if n>1 then hv(c,n-1);
                end;

            end;
      end;

BEGIN
assign (fi,'CAUTHANG.INP'); reset(fi); read(fi,n); close(fi);

Dem:=0; DemXuong:=0;
for i:=0 to n do
  for j:=0 to (n div 2) do
    begin
      if (i*1+j*2)=n then
        begin
          c:='';  d:=0;  inc(DemXuong);
          for gt:=1 to i do c:=c+chr(1+48);
          for gt:=1 to j do c:=c+chr(2+48); writeln(c,' ',demxuong); readln; hv(c,length(c));  inc(DemXuong,d); writeln(demxuong); readln;
        end;
      for z:=0 to (n div 3) do
        if (i*1+j*2+z*3)=n then
          begin
            c:='';  d:=0;  inc(dem);
            for gt:=1 to i do c:=c+chr(1+48);
            for gt:=1 to j do c:=c+chr(2+48);
            for gt:=1 to z do c:=c+chr(3+48); writeln(c,' ',dem); readln; hv(c,length(c)); inc(dem,d); writeln(dem); readln;
          end;
    end;



assign (fo,'CAUTHANG.OUT'); rewrite(fo); writeln (fo,dem*DemXuong); close(fo); writeln(dem,' ',Demxuong); readln;

END.
