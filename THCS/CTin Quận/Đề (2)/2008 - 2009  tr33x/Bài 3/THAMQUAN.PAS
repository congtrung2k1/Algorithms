program bai3_tr33_2;
var fi,fo: text;
    t,n,i,j,g,s: longint;
    A: array [0..15002] of longint;

BEGIN
assign (fi,'THAMQUAN.INP'); reset(fi);
assign (fo,'THAMQUAN.OUT'); rewrite(fo);
read (fi,t,n);

for i:=1 to n do read (fi,A[i]);

for i:=1 to n-1 do
  for j:=i to n do
    if abs(A[i])>abs(A[j]) then
      begin
        g:=A[i];
        A[i]:=A[j];
        A[j]:=g;
      end;

s:=0;
for i:=1 to n do
  if s+abs(A[i]-A[i-1]) <= t then
    begin
      g:=i;
      inc (s, abs(A[i]-A[i-1]));
    end else break;

writeln (fo,g);
close(fi); close(fo)
END.