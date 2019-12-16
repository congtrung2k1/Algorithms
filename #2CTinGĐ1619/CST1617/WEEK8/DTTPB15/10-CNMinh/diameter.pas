{$mode objfpc}
Const Fi='diameter.inp';
      Fo='diameter.out';
      nmax=1000000;
Type mg=record g,cs,kc: longint; end;
Var f: text;
    n,k,i,j,x,y: longint;
    free: array [0..nmax] of boolean;
    d,cha: array [0..nmax] of longint;
    a: array [0..nmax] of mg;
    sl: array [0..nmax div 2+1] of longint;
    b: array [0..nmax,0..19] of longint;
    log: integer;

Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(f,n,k);
 For i:=1 to k do sl[i]:=0;
 For i:=1 to n do begin readln(f,x,y);
                        cha[i]:=y;
                        a[i].g:=x;
                        inc(sl[x]); end;
 Close(F);
 log:=trunc((ln(n)/ln(2))+1e-8)+1;
 End;

Function Dfs(u:longint): longint;
 Var v:longint;
 begin
 free[u]:=false;
 If u=0 then exit(0);
 If not free[cha[u]] then begin d[u]:=d[cha[u]]+1; exit(d[u]); end
  else d[u]:=dfs(cha[u])+1;
 Exit(d[u]);
 End;

Procedure Calc;
 Begin
 For i:=1 to n do free[i]:=true;
 Free[0]:=false;
 d[0]:=0;
 For i:=1 to n do if free[i] then d[i]:=dfs(i);
 end;

Procedure Khoitao;
 Begin
 b[0,0]:=0;
 For i:=1 to n do b[i,0]:=cha[i];
 For j:=1 to log do
  For i:=0 to n do b[i,j]:=b[b[i,j-1],j-1];
 end;

Function getbit(k,x:longint): byte;
 Begin
 getbit:=(x shr(k-1)) and 1;
 End;

Function lca(u,v:longint): longint;
 Var t,k,bit: longint;
 Begin
 If d[u]>=d[v] then begin
  if d[u]>d[v] then begin
   t:=d[u]-d[v];
    for bit:=log downto 1 do
     if getbit(bit,t)=1 then u:=b[u,bit-1];
   end;
  For k:=log downto 0 do
   if b[u,k]<>b[v,k] then begin u:=b[u,k]; v:=b[v,k]; end else lca:=b[u,k];
  if u=v then lca:=u; end
  else result:=lca(v,u);
 end;

Function kc(u,v:longint): longint;
 Var tt:longint;
 Begin
 tt:=lca(u,v);
 exit(d[u]+d[v]-2*d[tt]);
 End;

procedure sort(l,r: longint);
var d1,d2: longint;
    y:mg;
begin
 if l>=r then exit;
 i:=l; j:=r;
 d1:=a[(l+r) div 2].g;
 d2:=a[(l+r) div 2].kc;
 repeat
  while (a[i].g<d1) or ((a[i].g=d1) and (a[i].kc>d2)) do inc(i);
  while (d1<a[j].g) or ((a[j].g=d1) and (a[j].kc<d2)) do dec(j);
  if not(i>j) then
   begin
   y:=a[i]; a[i]:=a[j]; a[j]:=y;
   inc(i); dec(j);
   end;
 until i>j;
 sort(l,j);
 sort(i,r);
end;

Procedure Try1;
 Var t,max,cc,kq,tam: longint;
 Begin
 For i:=1 to n do begin a[i].cs:=i; a[i].kc:=d[i]; end;
 sort(1,n);
 khoitao;
 For i:=2 to k do sl[i]:=sl[i]+sl[i-1];
 sl[0]:=0;
 For t:=1 to k do begin max:=-1;
  for i:=sl[t-1]+1 to sl[t] do
   if d[a[i].cs]>max then begin max:=d[a[i].cs]; cc:=a[i].cs; end;
  kq:=-1;
  For i:=sl[t-1]+1 to sl[t] do
   begin
   tam:=kc(cc,a[i].cs);
   If d[cc]+d[a[i].cs]>kq then begin
    if kq<tam then kq:=tam;
    end
  else if (d[cc]+d[a[i].cs])<=kq then break end;
 Writeln(f,kq);
 End;
 end;

Begin
 Init;
 Calc;
 Assign(F,FO); rewrite(F);
 Try1;
 ClosE(F);
End.



