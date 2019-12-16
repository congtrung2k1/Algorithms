CONST FI='RANGEQUERY2.INP';
      FO='RANGEQUERY2.OUT';


VAR N,K: LONGINT;
    LEAF,A,Lo,Hi: ARRAY [0..8*100000] OF LONGINT;
    Fx: Array [0..8*100000] of Int64;
    F,G: TEXT;


Procedure Build(x,low,high: Longint);
 Var mid: Longint;
 Begin
 Lo[x]:=Low; Hi[x]:=High;
 If Low=High then
  Begin
  Fx[x]:=A[low];
  Leaf[low]:=x;
  End
  Else
  Begin
  Mid:=(Low+High) Div 2;
  Build(X*2,Low,mid);
  Build(X*2+1,mid+1,High);
  Fx[x]:=Fx[x*2]+Fx[x*2+1];
  End;
 End;

Procedure Update(vt,gt: Longint);
 Var x: Longint;
 Begin
 X:=Leaf[vt];
 Fx[x]:=gt;
 While x>1 do
  Begin
  X:= X div 2;
  Fx[x]:=Fx[x*2]+Fx[x*2+1];
  End;
 End;


Function Query(x,l,r: Longint): int64;
 Begin
 If (Lo[x]>r) or (hi[x]<l) Then exit(0);
 If (Lo[x]>=l) And (Hi[x]<=r) then exit(Fx[x]);
 Exit(Query(x*2,l,r)+Query(x*2+1,l,r));
 End;


Procedure Init;
 Var i,u,v: Longint;
     c: char;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,n,k);
 For i:=1 to n do Read(f,a[i]);
 Readln(F);
 Build(1,1,N);
 For k:=1 to k do
  Begin
  read(f,c);
  Readln(f,u,v);
  If C='U' then Update(u,v);
  If C='Q' then Writeln(g,Query(1,U,v));
  End;
 Close(F); Close(G);
 End;



Begin
 Init;
End.