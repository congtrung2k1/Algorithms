CONST FI='SINHNHAT.INP';
      FO='SINHNHAT.OUT';
TYPE TLIST= ARRAY [0..4000005] OF LONGINT;
VAR K,B,U,T,S,SUM,N,M: LONGINT;
    X,Y,Z,V: ARRAY [0..2005] OF LONGINT;
    A1,A2: TLIST;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,sum,b,u,t,s);
 For b:=1 to b do read(f,X[b]); Readln(F);
 For u:=1 to u do Read(f,Y[U]); Readln(F);
 For t:=1 to t do Read(f,Z[t]); Readln(F);
 For s:=1 to s do Read(f,V[s]); Readln(F);
 Close(F);
 End;

procedure qsort(var a : tlist;mi,ma: Longint);
 procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
  while a[i]<x do inc(i);
  while x<a[j] do dec(j);
  if not(i>j) then
   begin
   y:=a[i]; a[i]:=a[j]; a[j]:=y;
   inc(i); Dec(j);
   end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;
 begin
  sort(mi,ma);
 end;

function TKNP(x:longint):longint;
 var l,r,k:longint;
 begin
 l:=1; r:=m;
 repeat
  k:=(l+r) div 2;
  if A2[k]<=x then l:=k else r:=k-1;
 until l+1>=r;
 if A2[r]<=x then exit(r) else if A2[l]<=x then exit(l) else exit(0);
end;


Procedure Try;
 Var i, j, Tmp: Longint;
     Ans: Int64;
 Begin
 For i:=1 to b do
  For j:=1 to u do
   If X[i]+Y[j]<sum Then Begin Inc(n); A1[n]:=X[i]+Y[j]; End;
 For i:=1 to t do
  For j:=1 to s do
  If Z[i]+V[j]<Sum then Begin Inc(m); A2[m]:=Z[i]+V[j]; end;
 Qsort(A2,1,m);
 Ans:=0;
 For i:=1 to n do
  Begin
  Tmp:=TKNP(Sum-A1[i]);
  If Tmp<>0 then Ans:=Ans+tmp;
  End;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Ans);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
