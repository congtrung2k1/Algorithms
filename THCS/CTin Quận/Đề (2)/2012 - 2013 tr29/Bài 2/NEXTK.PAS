program bai2_tr29_2;
var fi,fo: text;
    n,m,k,i,min: longint;
    v: string;

    procedure hv(v:string; m:longint);
      var i,so:longint;  c:char;
      begin
        if m=1 then exit else
          for i:=m downto 1 do
            begin
              c:=v[i]; v[i]:=v[m]; v[m]:=c;
              val(v,so);
              if (so<min) and (so>n) then min:=so;
              hv(v,m-1);
            end;
      end;

BEGIN
assign (fi,'NEXTK.INP'); reset(fi);
assign (fo,'NEXTK.OUT'); rewrite(fo);
read (fi,k,n); m:=n;

for i:=1 to k do
  begin
    min:=1000000000;
    str(n,v); hv(v,length(v)); n:=min;
  end;

writeln (fo,min);

close(fi); close(fo);
END.