program bai2_tr21_2;
var fi,fo: text;
    c: string;
    i,n,j,du,k,lt,t,tong: longint;

BEGIN
assign (fi,'CH15.INP'); reset(fi);
assign (fo,'CH15.OUT'); rewrite(fo);
read (fi,t);

for i:=1 to t do
  begin
   readln (fi,n); readln(fi,c);    tong:=0;
   for j:=n-1 downto 0 do
     begin
      du:=j mod 4;
      lt:=1;
      if c[n-j]='0' then lt:=0 else
            if du=0 then lt:=1 else for k:=1 to du do lt:=lt*2;

      tong:=tong+lt;
     end;
   if tong mod 15=0 then writeln(fo,1) else writeln(fo,0);
  end;

close(fi); close (fo);
END.
