program bai1_tr19_2;
var fi,fo: text;
    n,m,dem: longint;

    procedure hieu(var m:longint);
      var vv,v:string; g:char;
          i,j,l,n:longint;
      begin
        str(m,v);
        vv:='';
        for i:= 1 to length(v)-1 do
          for j:=i+1 to length(v) do
           if v[i]>v[j] then
             begin
              g:=v[i];
              v[i]:=v[j];
              v[j]:=g;
             end;
        for i:= length(v) downto 1 do vv:=vv+v[i];
        val(vv,l); val(v,n);
        m:=l-n;
      end;


BEGIN
assign (fi,'DL6174.INP'); reset(fi);
assign (fo,'DL6174.OUT'); rewrite(fo);
read (fi,n);

m:=n;
dem:=1;
while m<>6174 do
  begin
    inc(dem);
    hieu(m);
  end;
writeln (fo,dem);
close(fi); close(fo);
END.