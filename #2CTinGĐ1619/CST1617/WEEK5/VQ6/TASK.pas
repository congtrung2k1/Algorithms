Uses math;
Const
    fi='TASK.INP';
    fo='TASK.OUT';
    inf=1000000000;
Var
    g,f : Text;
    Bac,E,Fx,A,B,H : Array[0..1001] of LongInt;
    CT  : Array[0..1000001] of LongInt;
    C,C1   : Array[0..1001,0..1001] of Boolean;
    N,M,i,j,u,v,nE,kq,mini,kq2 : LongInt;

Procedure Init;
 Begin
 Assign(f,fi); Reset(f);
 Readln(f,N,M);
 FillChar(C,SizeOf(C),false);
 FillChar(Bac,SizeOf(Bac),0);
 For i:=1 to M do Begin Readln(f,u,v);
                        if C[u,v] then continue;
                        C[u,v]:=true; inc(Bac[v]);
                  End;
 Close(f);
 End;

Procedure TopoSort;
 Begin
 nE:=0; C1:=C;
 Repeat
 For i:=1 to N+1 do if Bac[i]=0 then break;
 if i=N+1 then break;
 inc(nE); E[nE]:=i; Bac[i]:=inf;
 For j:=1 to N do
  if C[i,j] then Begin C[i,j]:=false; dec(Bac[j]); End;
 Until false;
 C:=C1;
 End;

Procedure TimMax;
 Begin
 For i:=1 to N do
 Begin
 mini:=0;
 For j:=1 to N do if C[E[j],E[i]] and (Fx[j]>mini) then mini:=Fx[j];
 Fx[i]:=mini+1;
 if Fx[i]>kq then kq:=Fx[i];
 A[E[i]]:=Fx[i];
 End;
 For i:=1 to N do B[i]:=kq;
 For i:=N downto 1 do Begin
   mini:=kq;
   For j:=N downto 1 do
     if C[E[i],E[j]] and (B[E[j]]<mini) then mini:=B[E[j]];
   B[E[i]]:=mini-1;
   End;
 For i:=1 to n do inc(b[i]);
 For i:=1 to N do H[i]:=B[i]-A[i];
 End;

Procedure Swap (Var abc,xyz : LongInt);
 Var hv : LongInt;
 Begin
 hv:=abc; abc:=xyz; xyz:=hv;
 End;

Procedure QSort (l,r : LongInt);
 Var i1,j1,x,y : LongInt;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r;
 x:=H[(l+r) div 2];
 y:=A[(l+r) div 2];
 Repeat
 While (H[i1]<x) or ((H[i1]=x) and (A[i1]<y)) do inc(i1);
 While (H[j1]>x) or ((H[j1]=x) and (A[j1]>y)) do dec(j1);
 if i1<=j1 then
  Begin
  Swap(H[i1],H[j1]); Swap(A[i1],A[j1]); Swap(B[i1],B[j1]);
  inc(i1); dec(j1);
  End;
 Until i1>j1;
 QSort(l,j1); QSort(i1,r);
 End;

Procedure Try;
 Begin
 QSort(1,N);
 For i:=1 to N do Begin
                mini:=A[i];
                For j:=A[i]+1 to B[i] do if CT[j]<CT[mini] then mini:=j;
                inc(CT[mini]);
                if CT[mini]>kq2 then kq2:=CT[mini];
                 End;
 End;

Procedure Outp;
 Begin
 Assign(g,fo); Rewrite(g);
 Write(g,kq,' ',kq2);
 Close(g);
 End;

Begin
 Init;
 TopoSort;
 TimMax;
 Try;
 Outp;
End.


