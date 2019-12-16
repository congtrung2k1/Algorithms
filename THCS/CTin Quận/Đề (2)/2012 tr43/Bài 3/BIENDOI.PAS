program bai3_tr43_2;
var fi,fo: text;
    c:string;
    i,n,d,so: longint;

    procedure cs(vao:longint);
      var s:STRING;  z:longint;
      begin
        c:='';
        while vao<>0 do
          begin
            z:=vao mod 8;
            str(z,s);
            c:=s+c;
            vao:=vao div 8;
          end;
      end;
    procedure tinh(var c:string; cc:string);
      var   m,so,i,a,b:longint;  chch,chuoi:string;
      begin
        m:=0;  chuoi:='';
        for i:=length(c) downto 1 do
          begin
            val(c[i],a); val(cc[i],b);
            if (a<b) or (a<b+m) then
              begin
                inc(a,8);
                so:=a-(b+m);
                m:=1;
              end else begin so:=a-(b+m); m:=0; end;
            str(so,chch); chuoi:=chch+chuoi;
          end;
        c:=chuoi;
      end;

    function kt(c:string): boolean;
      var  i,j: longint;
      begin
        for i:=1 to length(c)-1 do
          for j:=i+1 to length(c) do
            if c[i]>c[j] then exit(false);
        exit(true);
      end;

    function sx(cc:string): string;
      var i,j: longint;    g: char;
      begin
        for i:=1 to length(c)-1 do
          for j:=i+1 to length(c) do
            if cc[i]>cc[j] then
              begin
                g:=cc[i]; cc[i]:=cc[j]; cc[j]:=g;
              end;
        sx:=cc;
      end;

BEGIN
assign (fi,'BIENDOI.INP'); reset(fi);
assign (fo,'BIENDOI.OUT'); rewrite(fo);
read (fi,n);

cs(n);
d:=1;
while (d<=5) and (kt(c)=false) do
  begin
    tinh(c,sx(c));
    inc(d);
  end;

d:=1; n:=0;
for i:= length(c) downto 1 do
  begin
    if i<>length(c) then d:=d*8;
    if c[i]<>'0' then
      begin
        val(c[i],so); n:=n+so*d;
      end;
  end;

writeln (fo,n);
close(fi); close(fo);
END.
