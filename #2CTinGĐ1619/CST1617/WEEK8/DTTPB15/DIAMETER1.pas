CONST FI='DIAMETER.INP';
      FO='DIAMETER.OUT';
TYPE LIST= RECORD
     COL,KC,ID: LONGINT; END;

VAR A: ARRAY [0..100005] OF LIST;
    D,SL: ARRAY [0..100005] OF LONGINT;
    B: ARRAY [0..100005,0..50] OF LONGINT;
    FREE: ARRAY [0..100005] OF BOOLEAN;
    F: TEXT;
    N,K,LOG: LONGINT;


PROCEDURE Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,k);
 For n:=1 to n do Begin
   Readln(f,Cha[n],A[n].Col);
   If Cha=0 then Root:=N;
   Inc(Sl[Col]);
   End;
 Close(F);
 log:=trunc((ln(n)/ln(2))+1e-8)+1;
 End;

Function Dfs(u:longint): longint;
 Var v:longint;
 Begin
 Free[u]:=false;
 If u=0 then exit(0);
 If not free[cha[u]] then begin d[u]:=d[cha[u]]+1; exit(d[u]); end
  else d[u]:=dfs(cha[u])+1;
 Exit(d[u]);
 End;

Procedure Khoitao;
 Begin
 Fillchar(Free,sizeof(Free),True);
 Fillchar(D,Sizeof(D),0);
 For i:=1 to n do If Free[i] then DFS(i);
 B[0,0]:=0;
 For i:=1 to n do b[i,0]:=cha[i];
 For j:=1 to log do
  For i:=0 to n do b[i,j]:=b[b[i,j-1],j-1];
 End;

Function getbit(k,x:longint): byte;
 Begin
 getbit:=(x shr(k-1)) and 1;
 End;

Function lca(u,v:longint): longint;
 Var t,k,bit: longint;
 Begin
 If d[u]>=d[v] then begin
  If d[u]>d[v] then begin
   t:=d[u]-d[v];
    for bit:=log downto 1 do
     if getbit(bit,t)=1 then u:=b[u,bit-1];
   end;
  For k:=log downto 0 do
   If b[u,k]<>b[v,k] then begin u:=b[u,k]; v:=b[v,k]; end else lca:=b[u,k];
  If u=v then lca:=u; end
  else result:=lca(v,u);
 end;


Function Tinh(U,V: Longint);
 Begin
 T:=LCA(U,V);
 Exit(D[U]+D[v]-2*D[T]);
 End;





