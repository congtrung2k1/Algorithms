Const fi='DANGTRI.INP';
      fo='DANGTRI.OUT';
Var g,f : Text;
    KQN,KQK : Array[0..10000] of Int64;
    i,j,test,k,nKQ : LongInt;
    N,tmp,swap   : Int64;

Function TimC (kk : longint ; nn : Int64) : Int64;
 Var res : Int64; i: longint;
 Begin
 res:=1;
 for i:=0 to kk-1 do begin
  if (res > (N div (nn-i)+1) * (i+1) ) then exit (N+1);
  res:= res * (nn-i);
  res:= res div (i+1);
  end;
 exit (res);
 End;

Procedure QSort (l,r : LongInt);
 Var i1,j1 : LongInt;
     x,y : Int64;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r;
 x:=KQN[(l+r) div 2]; y:=KQK[(l+r) div 2];
 Repeat
  While (KQN[i1]<x) or ((KQN[i1]=x) and (KQK[i1]<y)) do inc(i1);
  While (KQN[j1]>x) or ((KQN[j1]=x) and (KQK[j1]>y)) do dec(j1);
  if i1<=j1 then
   Begin
   swap:=KQN[i1]; KQN[i1]:=KQN[j1]; KQN[j1]:=swap;
   swap:=KQK[i1]; KQK[i1]:=KQK[j1]; KQK[j1]:=swap;
   inc(i1); dec(j1);
   End;
 Until i1>j1;
 QSort(l,j1); QSort(i1,r);
 End;


Procedure Try;
 Var l,r,x : Int64;
 Begin
 nKQ:=0;
 k:=0;
 while(TimC(k,2*k)<=N) do
  Begin
  l:=k+k; r:=N;
  Repeat
  x:=(l+r) div 2; tmp:=TimC(k,x);
  if tmp=N then
    Begin
    inc(nKQ); KQN[nKQ]:=x; KQK[nKQ]:=k;
    if x-k=k then break;
    inc(nKQ);
    KQN[nKQ]:=x;
    KQK[nKQ]:=x-k;
    break;
    End;
  if tmp>N then r:=x-1 else l:=x+1;
  Until l>r;
 inc(k);
 End;
 Writeln(g,nKQ);
 QSort(1,nKQ);
 For i:=1 to nKQ do Write(g,'(',KQN[i],',',KQK[i],') ');
 Writeln(g);
 End;


Procedure Init;
 Begin
 Assign(f,fi); Reset(f);
 Assign(g,fo); Rewrite(g);
 Readln(f,test);
 For test:=1 to test do
  Begin
  Readln(f,N);
  Try;
  End;
 Close(f); Close(g);
 End;

Begin
 Init;
End.
