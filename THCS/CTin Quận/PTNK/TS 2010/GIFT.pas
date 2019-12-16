var fi,fo: text;
    n,p,k,i,m: longint;
    A: array [0..1000000] of boolean;

BEGIN
assign (fi,'GIFT.INP'); reset(fi);
assign (fo,'GIFT.OUT'); rewrite(fo);
read (fi,n,p,k);
dec(n); m:=n; A[p]:=true; inc(p);

while m>1 do
begin
  i:=k;
  while (i<>0) do
    begin
      if A[p]=false then dec(i);
      inc(p); if p>n then p:=0;
    end;
  if p=0 then A[n]:=true else A[p-1]:=true;
  dec(m);
end;

for i:=0 to n do if  A[i]=false then begin writeln (fo,i); break; end;

close(fo);
END.