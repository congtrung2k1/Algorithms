program BANHSINHNHAT;
var fi,fo: text;
    A: array [1..1000000] of longint;
    n,i,j,g,d,m: longint; kt:boolean;

BEGIN
assign (fi,'CAKES.INP'); reset(fi);
assign (fo,'CAKES.OUT'); rewrite(fo);
read (fi,n);
for i:=1 to n do read (fi,A[i]);

for i:=1 to n-1 do
  for j:= i+1 to n do
    if A[i]>A[j] then begin g:=A[i]; A[i]:=A[j]; A[j]:=g; end;

d:=0;
for i:=n downto 1 do if A[i]>0 then
  begin
    m:=A[i] div 2 +1; kt:=false;
    while (kt=false) and (m>0) do
      begin
        dec(m);
        for j:=i downto 1 do if A[j]=m then begin inc(d); A[j]:=0; kt:=true; break; end;
      end;
    if kt=false then inc(d); A[i]:=0;
  end;

writeln (fo,d);

close(fo);
END.
