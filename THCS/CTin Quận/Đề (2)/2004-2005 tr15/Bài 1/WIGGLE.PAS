program bai1_tr15_2;
var fi,fo: text;
    n: string;
    i,d,vt: longint;

BEGIN
assign (fi,'WIGGLE.IN'); reset(fi);
assign (fo,'WIGGLE.OUT'); rewrite(fo);
read (fi,n);

i:=1; d:=1;
if n[1]>n[2] then vt:=1
  else if n[1]<n[2] then vt:=2;

d:=1; i:=0;
while i<length(n)-1 do
  begin
   inc(i);
   if (n[i]>n[i+1]) and (vt=1) then
     begin
      inc(d);
      vt:=2;
     end else if (n[i]<n[i+1]) and (vt=2) then
                begin
                 inc(d);
                 vt:=1;
                end;
   end;

writeln(fo,d);
close(fi); close(fo);
END.