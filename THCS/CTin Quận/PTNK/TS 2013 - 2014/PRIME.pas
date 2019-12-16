var fi,fo: text;
    N: LONGINT;

    function kt(vao:longint): boolean;
      var i,j: longint;
      begin
        j:=0;
        while (vao<>1) do
          begin
            i:=2;
            while vao mod i<>0 do inc (i);
            vao:=vao div i;
            if j=i then exit(false);
            if (j=0) and (vao=1) then exit(false);
            if (j<>0) and (vao<>1) then exit(false);
            j:=i;
          end;
        exit(true);
      end;

BEGIN
assign (fi,'PRIME.INP'); reset(fi);
assign (fo,'PRIME.OUT'); rewrite(fo);
read (fi,n);  dec(n);

while kt(n)=false do
  begin
    dec(n);
  end;

writeln (fo,n);
close(fo);
END.
