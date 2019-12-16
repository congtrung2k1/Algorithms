program BASE;
label l1;
var fi,fo: text;
    n,i,j,d: longint;  c,cc1,cc2: string;

    function cong(ss,s: longint): string;
      var i:longint;
      begin
        cong:='';
        for i:=ss to s do
          cong:=cong+c[i];
      end;

BEGIN
assign (fi,'BASE.IN'); reset(fi);
assign (fo,'BASE.OUT');  REWRITE(FO);

readln (fi,n); readln (fi,c);
while pos(' ',c)<>0 do delete(c,pos(' ',c),1);

for i:=1 to n do
  begin
    d:=i+1; cc1:=cong(1,i);
        while (d<=n) do
          begin
            inc(d,i);
            cc2:=cong(d-i,d-1);
            if (cc1=cc2) then
              begin if d-1=n then goto l1 end
            else if (cc1<>cc2) then break;
          end;
  end;

l1: writeln (fo,i);
for j:=1 to i do write (fo,c[j],' ');
close(fo);
END.
