program bai2_tr35_4;
var fi,fo: text;
    n,k,i,d: longint;
    luu,c: string;
    AA: array [1..9999999] of longint;

    function add(a,b:string): string;
      var du,s,i:longint; c,cc:string;
      begin
        add:='';  du:=0;
        while length(b)<length(a) do b:='0'+b;
      //while length(a)<length(b) do a:='0'+a;
        for i:= length (a) downto 1 do
          begin
            s:= (ord(a[i])-48) + (ord(b[i])-48) + du;
            du:= s div 10;
            add:= chr(s mod 10 +48)+add;
          end;
        if du>0 then add:='1'+add;
      end;

    function nhan(a,b:string): string;
      var m,j,i:longint; c:string;
      begin
        m:=-1; nhan:='';
        for i:=length(a) downto 1 do
          begin
            inc(m); c:='';
            for j:=1 to ord(a[i])-48 do c:=add(b,c);
            for j:=1 to m do c:=c+'0';
            nhan:=add(c,nhan);
          end;
      end;

    function lt(vao:longint): string;
      var n,v:string;
      begin
        str(vao,v); n:=v;
        for i:=2 to k do n:=nhan(n,v);  writeln (AA[d]);
        lt:='';
        if length(n)=1 then lt:=n else lt:=n[length(n)-1]+n[length(n)];
        if lt<>luu then begin inc(d); val(lt,AA[d]); end;
      end;

BEGIN
assign (fi,'LUYTHUA.INP'); reset(fi);
assign (fo,'LUYTHUA.OUT'); rewrite(fo);
read (fi,n,k);

d:=0; luu:=lt(n); val(luu,n);

while lt(n)<>luu do n:=AA[d];

for i:=1 to d do write (fo,AA[i],' ');

close(fi); close(fo);
END.
