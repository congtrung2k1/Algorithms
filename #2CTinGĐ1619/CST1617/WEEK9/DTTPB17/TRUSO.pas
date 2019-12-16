uses math;
Const FI='TRUSO.INP';
      FO='TRUSO.OUT';

VAR f: text;
    a,dsk: array [0..10001,0..10001] of longint;
    soluong: array [0..10001] of longint;
    dd,d,pa,child,tree,root,d1,d2: array [0..10001] of longint;
    n,i,j,u,v,p,ntree,an,tmp,l1,l2,t1,ans,k: longint;

Procedure Init;
 begin
 Assign(F,fI); reset(F);
 Readln(F,n,p);
 For i:=1 to n-1 do
  begin
  readln(F,u,v,a[u,v]);
  a[v,u]:=a[u,v];
  inc(soluong[u]); inc(soluong[v]);
  dsk[u,soluong[u]]:=v;
  dsk[v,soluong[v]]:=u;
  End;
 Close(F);
 End;

Procedure DFS(x: longint);
 Var maxc,y,vt: longint;
 Begin
 dd[x]:=dd[pa[x]]+1;
 child[x]:=1;
 maxc:=0;
 For vt:=1 to soluong[x] do
  begin
  y:=dsk[x,vt];
  if y=pa[x] then continue;
  pa[y]:=x;
  d[y]:=d[x]+a[x,y];
  dfs(y);
  Inc(child[x],child[y]);
  if child[y]>maxc then
   begin
   maxc:=child[y];
   tree[x]:=tree[y];
   end;
  end;
 if child[x]<>1 then exit;
 inc(ntree);
 tree[x]:=ntree;
 end;


Procedure Khoitao;
 Begin
 ntree:=0;
 dd[p]:=0;
 pa[p]:=p;
 dfs(p);
 dd[0]:=maxlongint;
 For i:=1 to n do
  if dd[i]<dd[root[tree[i]]] then root[tree[i]]:=i;
 end;

Function LCA(x,y: longint): longint;
 begin
 while tree[x]<>tree[y] do
  if dd[root[tree[x]]]>dd[root[tree[y]]] then
   x:=pa[root[tree[x]]] else y:=pa[root[tree[y]]];
  if dd[x]<dd[y] then exit(x) else exit(y);
 End;

PRocedure Try;
 Begin
 Khoitao;
 l1:=-1; tmp:=0;
 For i:=1 to n do
  if i<>p then begin
  an:=lca(i,p);
  tmp:=d[i]+d[p]-2*d[an];
  if tmp>l1 then begin l1:=tmp; t1:=i; end;
  end;
 l2:=maxlongint;
 While t1<>p do begin
  ans:=-maxlongint;
  for i:=1 to n do
   if (i<>p) then begin
    an:=lca(i,t1);
    ans:=max(ans,min(d[i]+d[t1]-d[an]*2,d[i]));
    end;
   l2:=min(l2,ans);
   t1:=pa[t1];
   end;
 Assign(f,FO); rewrite(F);
 Writeln(f,l1-l2);
 Close(F);
 End;

Begin
 Init;
 Try;
End.

