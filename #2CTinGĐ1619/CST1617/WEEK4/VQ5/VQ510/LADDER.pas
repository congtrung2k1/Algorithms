const fi='LADDER.inp';
      fo='LADDER.out';
var t2,t1,i,n,m:longint;
    Up,down,a:array[0..100100] of longint;

begin
 assign(input,fi); reset(input);
 assign(output,fo); rewrite(output);
 read(n,m);
 for i:=1 to n do read(a[i]);
 for i:=n-1 downto 1 do
  if a[i]<=a[i+1] then Up[i]:=Up[i+1]+1 else Up[i]:=1;
 for i:=1 to n do
  if a[i-1]>=a[i] then Down[i]:=Down[i-1]+1 else down[i]:=1;
 for i:=1 to m do
  begin
  read(t1,t2);
  if (Up[t1]+Down[t2]>=t2-t1+1) then writeln(1) else writeln(0);
  end;
end.
