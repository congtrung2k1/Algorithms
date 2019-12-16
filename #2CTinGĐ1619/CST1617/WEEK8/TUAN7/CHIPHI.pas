Uses math;
CONST FI='CHIPHI.INP';
      FO='CHIPHI.OUT';
      Inf=100000000;
VAR A,D: ARRAY [0..350,0..350] OF LONGINT;
    T,ID: ARRAY [0..350] OF LONGINT;
  // D: ARRAY [0..350,0..350] OF INT64;
    F,G: TEXT;
    U,V,K,N,M,X,C: LONGINT;

Procedure Swap(Var x,y: Longint);
 Var tmp: Longint;
 Begin
 Tmp:=x; X:=y; Y:=Tmp;
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=t[(l+r) div 2];
 repeat
 while t[i]<x do inc(i);
 while x<t[j] do dec(j);
 if not(i>j) then
  begin
  Swap(t[i],t[j]);
  Swap(id[i],id[j]);
  inc(i); dec(j);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Floyd;
 Begin
 For k:=1 to n do
  For u:=1 to n do
   For v:=1 to n do
    If A[u,v]>=A[u,id[k]]+A[id[k],v] then
     Begin
     A[u,v]:=A[u,id[k]]+A[id[k],v];
     If D[u,v]>a[u,v]+Max(T[U],Max(T[V],T[K])) then
       D[u,v]:=a[u,v]+Max(T[U],Max(T[V],T[K]));
     End
 End;

PRocedure Init;
 Begin
 Assign(F,fi); Reset(F);
 Assign(g,FO); Rewrite(G);
 Readln(f,n,m,x);
 For n:=1 to n do Begin Readln(F,T[n]); Id[n]:=n; end;
 For u:=1 to n do
  For v:=1 to n do Begin A[u,v]:=Inf; D[u,v]:=inf; End;
 For m:=1 to m do
  Begin
  Readln(f,u,v,c);
  A[u,v]:=c; A[v,u]:=c; //D[u,v]:=C+Max(T[u],T[v]); D[v,u]:=D[u,v];
  End;
 Sort(1,n);
 Floyd;
 For x:=1 to x do
  Begin
  Readln(F,u,v);
  Writeln(g,D[u,v]);
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.
