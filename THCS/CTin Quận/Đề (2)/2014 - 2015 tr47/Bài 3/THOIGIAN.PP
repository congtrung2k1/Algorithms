program bai3_tr47_2;
label l1;
var fi,fo: text;
    v,d,h,n,a,b: integer; c,cc: string;

    procedure tinh(vao:string);
      var a:integer;
      begin
        val(vao,a);
        case a of
          0: begin dec(d,4); dec(n,2); end;
          1: dec(d,2);
          2,3,5: begin dec(d,2); dec(n,3); end;
          4: begin dec(d,3); dec(n,1); end;
          6,9: begin dec(d,3); dec(n,3); end;
          7: begin dec(d,2); dec(n,1); end;
          8: begin dec(d,4); dec(n,3); end;
        end;
      end;

BEGIN
assign (fi,'THOIGIAN.INP'); reset(fi);
assign (fo,'THOIGIAN.OUT'); rewrite(fo);
read (fi,v,h);


for a:=0 to 23 do
  for b:=0 to 59 do
    begin
      d:=v; n:=h;
      str(a,c); str(b,cc);
      if a<10 then tinh(c) else 
 			begin tinh(c[1]); tinh(c[2]); end;
      if b<10 then cc:='0'+cc;
      tinh(cc[1]); tinh (cc[2]);
      if (d=0) and (n=0) then goto l1;
    end;

l1: writeln (fo,c,':',cc);

close(fi); close(fo);
END.
