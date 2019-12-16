program bai4_tr25_4;
var fi,fo: text;
    A,B: array [1..10000000] of longint;
    i,n,j,g: longint;

    procedure bb(v:longint);
      var  pt,i,j:longint;
      begin
       pt:=0;
       for i:=1 to n do
        if (A[i] mod 2=v) then
          if ((A[i+1]) mod 2=v) and (A[i+1]<>0)
              or ((A[i-1]) mod 2=v) and (A[i-1]<>0) then
            begin
              inc(pt);
              B[pt]:=A[i];
            end else begin inc(pt); B[pt]:=0; end;

       i:=1;
       while i<=n do
         begin
          if B[i]<>0 then write (fo,B[i],' ') else writeln (fo);
          inc(i);
         end;   writeln(fo);

      end;

BEGIN
assign (fi,'INPUT.INP'); reset (fi);
assign (fo,'OUTPUT.OUT'); REWRITE(fo);

n:=0;
while not eof (fi) do
  begin
    inc(n);
    read (fi,A[n]);
  end;

bb(0); bb(1);

for i:=1 to n-1 do
  for j:=i+1 to n do
    if A[i]>A[j] then
      begin
        g:=A[i]; A[i]:=A[j]; A[j]:=g;
      end;

for i:=1 to n do write (fo,A[i],' ');

close(fi); close(fo);
END.
