program FLAG;
label l1;
var fi,fo: text;
    a,b,c,d: longint;

BEGIN
assign (fi,'FLAG.INP'); reset(fi);
assign (fo,'FLAG.OUT'); rewrite(fo);
read (fi,a,b,c);

d:=0;
if c>0 then
   if c<a+b*2 then begin inc (d,c);
                        if a>c then dec(a,c) else begin dec(b,(c-a)); a:=0; end;
                  end else begin inc(d,a+b*2); goto l1 end;

if b>0 then
  if a>=b*2 then
        while (b<>0) do
          begin dec(b,1); dec(a,2); inc(d,2); end
  else while (b<>0) and (b*2>=4) do
         begin dec(b,2); inc(d,2); end;

if a>3 then while a div 4<>0 do begin inc(d,3); dec(a,4); end;


l1: writeln (fo,d);

close(fo);
END.
