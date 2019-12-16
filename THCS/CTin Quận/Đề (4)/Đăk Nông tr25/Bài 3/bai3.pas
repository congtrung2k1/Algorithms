program bai2_tr25_4;
var fi,fo: text;
    i,m,n: LONGINT;

    function kt(vao:longint): boolean;
      var i:longint;
      begin
        for i:= 2 to trunc(sqrt(vao)) do
          if vao mod i=0 then exit(false);
        exit(true);
      end;

BEGIN
assign (fi,'bai3.inp'); reset(fi);
assign (fo,'bai3.out'); rewrite(fo);
read (fi,n);

i:=0;  m:=1;
while i<n do
  begin
    inc(m);
    if kt(m)=true then inc(i);
  end;

writeln (fo,m);
close(fi); close(fo);
END.