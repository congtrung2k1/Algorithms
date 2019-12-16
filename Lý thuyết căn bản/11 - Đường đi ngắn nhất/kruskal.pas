type  edge=record u,v,c:longint end;
var f:text; n,m,sum,res,i,j,r1,r2,cnt:longint;
    e:array[1..100000] of edge;
    lab,id:array[1..100000] of longint;

function getroot(x:longint):longint;
begin
    while lab[x]>0 do x:=lab[x];
    exit(x)
end;

procedure union(r1,r2:longint);
var x:longint;
begin
  x:=lab[r1]+lab[r2];
  if lab[r1]>lab[r2] then
  begin lab[r1]:=r2; lab[r2]:=x end
  else
  begin lab[r1]:=x; lab[r2]:=r1 end
end;

procedure sort(l,r:longint);
var i,j,x,t:longint;
begin
  if l>=r then exit;
  i:=l; j:=r; x:=e[id[l+random(r-l+1)]].c;
  repeat
    while e[id[i]].c>x do inc(i);
    while e[id[j]].c<x do dec(j);
    if i<=j then
    begin
      t:=id[i]; id[i]:=id[j]; id[j]:=t;
      inc(i); dec(j)
    end
  until i>j;
  sort(l,j); sort(i,r)
end;

begin
  read(n,m);
  sum:=0;
  for i:=1 to m do
    with e[i] do
    begin read(u,v,c); inc(sum,c); id[i]:=i end;
  for i:=1 to n do lab[i]:=-1;
  randomize; sort(1,m);
  res:=0; cnt:=0;
  for i:=1 to m do
    with e[id[i]] do
    begin
      r1:=getroot(u); r2:=getroot(v);
      if r1<>r2 then
      begin
        inc(cnt); inc(res,c);
        if cnt=n-1 then break;
        union(r1,r2)
      end
    end;
  write(res)
end.