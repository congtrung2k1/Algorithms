program ZERO;
var fi,fo: text;
    i,j,n,m: longint;
    A: array [1..100000] of string;
    c,cc: string;

    function a2(l,n: string): string;         //cong
      var du,sum,i,b,a: longint;    cc: string;
      begin
        du:=0;     sum:=0;    cc:='';  a2:='';
        while length(n)>length(l) do l:='0'+l;
        while length(l)>length(n) do n:='0'+n;
        for i:=length(l) downto 1 do
          begin
            val(l[i],a);  val(n[i],b);
            sum:=a+b+du;
            du:=sum div 10; str(sum mod 10,cc);
            a2:=cc+a2;
          end;
        if du>0 then a2:='1'+a2;
      end;

    function a1(l,n: string): string;         //nhan
      var m,i,j,a: longint; cc: string;
      begin
        m:=-1; cc:=''; a1:='';
        for i:=length(n) downto 1 do
          begin
            inc(m);    val(n[i],a);
            cc:=''; for j:=1 to a do cc:= a2(cc,l);
            for j:=1 to m do cc:=cc+'0';
            a1:= a2(cc,a1);
          end;
      end;

BEGIN
assign (fi,'ZERO.IN'); reset(fi);
assign (fo,'ZERO.OUT'); REWRITE(FO);
read (fi,n);   m:=n;
for i:=1 to n do begin str(i,c); A[i]:=c; end;

for i:=1 to n-1 do
  begin
    dec(m);
    for j:=1 to m do  A[j]:= a1(A[j],A[j+1]);
    A[m+1]:='';
  end;
cc:=A[1];
for i:= length(cc) downto 1 do
  if cc[i]<>'0' then break;
writeln (fo,length(cc)-i);

close(fo);
END.