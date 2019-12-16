uses math;
var n,q,l,r:longint;
    a:array[1..1000000]of int64;
    m:array[0..20,1..1000000]of int64;

procedure init;
var i,j,p:longint;
begin
  for n:=1 to n do
    m[0,n]:=a[n];
  for i:=1 to floor(log2(n)) do
  begin
    p:=1 shl (i-1);
    for j:=1 to n-(1 shl i)+1 do
      m[i,j]:=min(m[i-1,j],m[i-1,j+p])
  end
end;

procedure solve(l,r:longint);
var ans:int64; tmp:longint;
begin
  ans:=round(1e18);
  r:=r-l+1;
  repeat
    tmp:=floor(log2(r));
    ans:=min(ans,m[tmp,l]);
    tmp:=1 shl tmp;
    r:=r mod tmp;
    inc(l,tmp)
  until r=0;
  writeln(ans)
end;

begin
  read(n);
  for n:=1 to n do read(a[n]);
  init;
  read(q);
  for q:=1 to q do
  begin
    read(l,r);
    solve(l,r)
  end;
end.
