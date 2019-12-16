var fi,fo: text;
    max,n,m,i,j,z,vi,vj:longint;
    A: array [0..100001,0..100001]  of record gt:longint; kt:boolean; end;

    function ktra(vi,vj:longint): boolean;
      var d:byte;
      begin
        d:=0;
        if (vi=2) and (vj=2) then exit(true);
        if (A[vi+1,vj].kt=true) and (vi<3) then inc(d);
        if (A[vi-1,vj].kt=true) and (vi>1) then inc(d);
        if (A[vi,vj+1].kt=true) and (vj<3) then inc(d);
        if (A[vi,vj-1].kt=true) and (vj>1) then inc(d);
        if d>=3 then exit(true) else exit(false);
      end;

BEGIN
assign (fi,'TREASURE.INP'); reset(fi);
assign (fo,'TREASURE.OUT'); rewrite(fo);
read (fi,n);

for z:=1 to n do
  begin
    m:=9; max:=9; vi:=0; vj:=0;
    for i:=1 to 3 do
      for j:=1 to 3 do
        begin
          read (fi,A[i,j].gt); write(A[i,j].gt); readln;
          A[i,j].kt:=true;
          if A[i,j].gt=9 then begin A[i,j].kt:=false; write(fo,9); vi:=i; vj:=j; end;
        end;
    dec(m);  while max<>0 do
               begin
                 dec(max);
                 if A[vi-1,vj].gt=max then begin A[vi-1,vj].kt:=false; dec(vi); write(fo,A[vi,vj].gt); break; end;
                 if A[vi+1,vj].gt=max then begin A[vi+1,vj].kt:=false; inc(vi); write(fo,A[vi,vj].gt); break; end;
                 if A[vi,vj-1].gt=max then begin A[vi,vj-1].kt:=false; dec(j); write(fo,A[vi,vj].gt); break; end;
                 if A[vi,vj+1].gt=max then begin A[vi,vj+1].kt:=false; inc(j); write(fo,A[vi,vj].gt); break; end; dec(max);
                end; dec(m);
    while m<>0 do
      begin
        max:=9;
        while max<>0 do
               begin
                 dec(max);
                 if (A[vi-1,vj].gt=max) and (A[vi-1,vj].kt=true)
                                    then  if ktra(vi-1,vj)=true then begin dec(vi); break; end;
                 if (A[vi+1,vj].gt=max) and (A[vi+1,vj].kt=true)
                                    then  if ktra(vi+1,vj)=true then begin inc(vi); break; end;
                 if (A[vi,vj-1].gt=max) and (A[vi,vj-1].kt=true)
                                    then  if ktra(vi,vj-1)=true then begin dec(vj); break; end;
                 if (A[vi,vj+1].gt=max) and (A[vi,vj+1].kt=true)
                                    then  if ktra(vi,vj)=true then begin dec(vi); break; end;
                 dec(max);
                end;
        A[vi,vj].kt:=false; write(fo,A[vi,vj].gt); dec(m);
      end;
    writeln (fo);
  end;


close(fo);
END.
