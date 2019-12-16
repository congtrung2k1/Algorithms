uses math;
const
   fi = 'truso.inp';
   fo = 'truso.out';
   oo = trunc(1e9);
   maxN = 10000;

type
   kn = 0..maxN;
   Pnode = ^Tnode;
   Tnode = record
      ke,gt:longint;
      next:Pnode;
   end;
   arrN = array[kn] of longint;
   DSK  = array[kn] of Pnode;

var
   n:longint;
   root1,root2,l1,l2:longint;
   ds:DSK;

   p,h,d:arrN;
   pa:array[kn,0..15] of longint;

procedure them(var ds:Pnode;v,t:longint);
var
   p:Pnode;
begin
   new(p);
   p^.ke := v;
   p^.gt := t;
   p^.next := ds;
   ds := p;
end;

procedure dfs(u:longint);
var
   iv:Pnode;
   v,t:longint;
begin
   iv := ds[u];
   while iv <> nil do
   begin
      v := iv^.ke;
      t := iv^.gt;
      if p[v] = 0 then
      begin
         p[v] := u;
         h[v] := h[u] + 1;
         d[v] := d[u] + t;
         dfs(v);
      end;
      iv := iv^.next;
   end;
end;

procedure setupLCA();
var
   i,j:longint;
begin
   p[root1] := -1; dfs(root1); p[root1] := 0;

   for i := 1 to n do pa[i,0] := p[i];

   for j := 1 to trunc(log2(n)) do
      for i := 1 to n do
         if h[i] >= (1 << j) then
            pa[i,j] := pa[pa[i,j-1],j-1];
end;

function LCA(u,v:longint):longint;
var
   i,tmp:longint;
begin
   if h[u] < h[v] then begin tmp := u; u := v; v := tmp; end;

   while h[u] > h[v] do
   begin
      tmp := trunc(log2(h[u]-h[v]));
      u := pa[u,tmp];
   end;

   if u = v then exit(u);

   while pa[u,0] <> pa[v,0] do
   begin
      tmp := trunc(log2(h[u]));
      for i := tmp downto 0 do
         if pa[u,i] <> pa[v,i] then
         begin
            u := pa[u,i];
            v := pa[v,i];
            break;
         end;
   end;
   exit(pa[u,0]);
end;

function dist(u,v:longint):longint;
begin
   dist := d[u] + d[v] - 2*d[LCA(u,v)];
end;

procedure nhap();
var
   i,u,v,t:longint;
begin
   read(n,root1);
   for i := 1 to n-1 do
   begin
      read(u,v,t);
      them(ds[u],v,t);
      them(ds[v],u,t);
   end;
end;

procedure xuli();
var
   i,e1,len:longint;
begin
   for i := 1 to n do
      if d[i] > l1 then
      begin
         l1 := d[i];
         e1 := i;
      end;

   l2 := oo;
   while p[e1] <> 0 do
   begin

      len := 0;
      for i := 1 to n do
      begin
         if (i = root1) or (i = e1) then continue;
         len := max(len,min(d[i],dist(i,e1)));
      end;
      if len < l2 then
      begin
         l2 := len;
         root2 := e1;
      end;

      e1 := p[e1];
   end;

   writeln(l1-l2);
end;

begin
   assign(input,fi);reset(input);
   assign(output,fo);rewrite(output);
   nhap();
   setupLCA();
   xuli();
end.