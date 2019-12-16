var fi,fo: text;
    f

    function();
      var
      begin

      end;

BEGIN
assign (fi,'HANDS.INP'); reset(fi); read(fi,nChuoi); close(fi);
for i:=1 to length(nChuoi) do
  begin if nChuoi[i]='L' then A[i]:=0 else A[i]:=1; end;

dem:=0; dLuot:=0;
n:=nChuoi; kt:=true;
while kt do
  begin
    d:=0;
    for i:=1 to n-1 do
       if (A[i]=1) and (A[i+1]=0) then
          begin inc(d); A[i]:=0; A[i+1]:=1; end;

    if d>0 then begin kt:=true; inc(dLuot); end;
    inc(dem,d);


  end;



close(fo);
END.