program COUPLE;
var fi,fo: text;
    x,y,i,j,n,t: longint;
    A: array [1..100000000] of  longint;

BEGIN
assign (fi,'COUPLE.INP'); reset (fi);
assign (fo,'COUPLE.OUT'); rewrite(fo);
read (fi,n,t);
for i:=1 to n do read(fi,A[i]);

x:=1000000000;
for i:=1 to n-1 do
  for j:=i to n do
    if A[i]+A[j]=t then
      if (A[i]<=A[j]) then  begin
        if x>A[i] then begin x:=A[i]; y:=A[j]; end; end
      else if x>A[j] then begin x:=A[j]; y:=A[i]; end;

writeln (fo,x,' ',y);
close(fo);
END.
