Uses math;
CONST FI='HOITRAI.INP';
      FO='HOITRAI.OUT';
      Inf=100000000;
VAR A: ARRAY [0..350,0..350] OF LONGINT;
    D: ARRAY [0..350,0..350] OF INT64;
    F,G: TEXT;
    U,V,K,N,M,X: LONGINT;


Procedure Floyd;
 Begin
 For k:=1 to n do
  For u:=1 to n do
   For v:=1 to n do
    If A[u,v]>A[u,k]+A[k,v] then
     Begin
     A[u,v]:=A[u,k]+A[k,v];
     D[u,v]:=D[u,k]*D[k,v];
     End
     Else
     If (A[u,v]=A[u,k]+A[k,v]) then D[u,v]:=D[u,k]*D[k,v]+D[u,v];
 End;

PRocedure Init;
 Begin
 Assign(F,fi); Reset(F);
 Assign(g,FO); Rewrite(G);
 Readln(f,n,m,x);
 For u:=1 to n do
  For v:=1 to n do Begin A[u,v]:=Inf; D[u,v]:=0; End;
 For m:=1 to m do
  Begin
  Readln(f,u,v);
  A[u,v]:=1; A[v,u]:=1; inc(D[u,v]); Inc(D[V,u]);
  End;
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
