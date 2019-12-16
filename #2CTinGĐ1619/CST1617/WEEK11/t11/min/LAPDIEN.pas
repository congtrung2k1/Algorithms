CONST FI='LAPDIEN.INP';
      FO='LAPDIEN.OUT';
      Inf=200000005;
VAR A: ARRAY [0..1001,0..1001] OF REAL;
    C: ARRAY [0..1001,0..1001] OF BOOLEAN;
    Free: ARRAY [0..1001] OF BOOLEAN;
    Trace: ARRAY [0..1001] OF LONGINT;
    X,Y,D: ARRAY [0..1001] OF Real;
    N,M: LONGINT;
    K: Real;
    F: TEXT;

Function Cal(u,v: Longint):Real;
 Begin
 exit(Sqrt(sqr(X[u]-X[v])+Sqr(Y[v]-Y[u])));
 End;

Procedure Init;
 Var i,j,u,v: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m);
 Readln(F,K);
 K:=K*1000;
 fillchar(C,sizeof(C),False);
 For n:=1 to n do
  Begin Readln(f,X[n],Y[n]);
        X[n]:=X[n]*1000;
        Y[n]:=Y[n]*1000; end;
 For i:=1 to n do
  For j:=1 to n do Begin
  A[i,j]:=Cal(i,j);
  If A[i,j]>K Then A[i,j]:=inf;
  A[j,i]:=A[i,j];
  End;
 For m:=1 to m do Begin Readln(f,u,v); A[u,v]:=0; A[v,u]:=0; End;
 Close(F);
 End;

Procedure Dji;
 Var u,v,i: Longint;
     mi: Real;
 Begin
 Repeat
 mi:=inf; u:=0;
 For i:=1 to n do
  If D[i]<mi then If Free[i] then Begin mi:=D[i]; u:=i; end;
 If mi=inf then break;
 Free[u]:=False;
 for v:=1 to n do
  If (D[u]+A[u,v]<D[V]) And (A[u,v]<>inf) then D[v]:=D[u]+A[u,v];
 Until False;
 End;

Procedure Try;
 Var i,u,v: Longint;
 Begin
 Fillchar(Free,sizeof(Free),True);
 For i:=1 to n do Trace[i]:=i;
 For i:=1 to n do D[i]:=Inf;
 D[1]:=0;
 Dji;
 Assign(f,fo); Rewrite(F);
 If D[n]=inf then Writeln(f,-1) Else Writeln(F,trunc(D[n]));
 Close(F);
 End;


Begin
 Init;
 Try;
end.
