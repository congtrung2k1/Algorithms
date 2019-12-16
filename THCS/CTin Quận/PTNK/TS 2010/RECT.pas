var fi,fo: text;
    Z: array [1..100000] of record a,b:longint; c:boolean; end;
    n,sl,max,i,j,d: longint;   q,w,e,r: extended;

BEGIN
assign (fi,'RECT.INP'); reset(fi);
assign (fo,'RECT.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do read (fi,Z[i].a,Z[i].b);

sl:=0; max:=0;
for i:=1  to n-1 do
  if Z[i].c=false then
    begin
      inc(sl); d:=1;  Z[i].c:=true;
      for j:=i+1 to n do
        if Z[j].c=false then
        begin
          q:= Z[i].a / Z[i].b;
          w:= Z[j].a / Z[j].b;
          e:= Z[i].a / Z[j].b;
          r:= Z[j].a / Z[i].b;
          if (q=w) or (e=r) then
            begin
              inc(d); Z[j].c:=true;
            end;
        end;
      if d>max then max:=d;
    end;
if Z[n].c=false then inc(sl);
writeln(fo,sl,' ',max);

close(fo);
END.