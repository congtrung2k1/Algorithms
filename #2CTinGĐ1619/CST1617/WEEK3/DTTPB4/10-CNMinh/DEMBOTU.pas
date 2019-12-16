Const fi='DEMBOTU.INP';
      fo='DEMBOTU.OUT';
Var g,f : Text;
    A,B : Array[1..1000] of LongInt;
    C   : Array[1..1000000] of LongInt;
    N,M,P,Q,i,j,dem,tmp,lt,lp : LongInt;
    kq: int64;

Procedure Init;
 Begin
  Assign(f,fi); Reset(f);
  Readln(f,M,N,P,Q);
  For i:=1 to M do Read(f,A[i]);
  For i:=1 to N do Read(f,B[i]);
  dem:=0;
  For i:=1 to M do
   For j:=1 to N do
   Begin
   inc(dem);
   C[dem]:=A[i]+B[j];
   End;
  For i:=1 to P do Read(f,A[i]);
   For i:=1 to Q do Read(f,B[i]);
  Close(f);
 End;

Procedure QSort (l,r : LongInt);
 Var x,i1,j1 : LongInt;
 Begin
 If l>=r then exit;
 i1:=l; j1:=r;
 x:=C[(l+r) div 2];
 Repeat
 While C[i1]<x do inc(i1);
 While C[j1]>x do dec(j1);
 If i1<=j1 then Begin i:=C[i1]; C[i1]:=C[j1]; C[j1]:=i;
                      inc(i1); dec(j1);
                      End;
 Until i1>j1;
 QSort(l,j1); QSort(i1,r);
 End;

Procedure Tim_Trai (l,r : LongInt);
 Var x : LongInt;
 Begin
 If l>r then exit;
 x:=(l+r) div 2;
 If C[x]>tmp then Tim_Trai(l,x-1);
 If C[x]=tmp then Begin If x<lt then lt:=x; Tim_Trai(l,x-1); End;
 If C[x]<tmp then Tim_Trai(x+1,r);
 End;

Procedure Tim_Phai (l,r : LongInt);
 Var x : LongInt;
 Begin
 If l>r then exit;
 x:=(l+r) div 2;
 If C[x]>tmp then Tim_Phai(l,x-1);
 If C[x]<tmp then Tim_Phai(x+1,r);
 If C[x]=tmp then Begin If x>lp then lp:=x; Tim_Phai(x+1,r);End;
 End;

Procedure Try;
 Begin
 QSort(1,dem);
 kq:=0;
 For i:=1 to P do
  For j:=1 to Q do
  Begin
  tmp:=A[i]+B[j];
  lt:=maxLongInt;
  lp:=0;
  Tim_Trai(1,dem);
  Tim_Phai(1,dem);
  If (lt<maxLongInt) and (lp<>0) then kq:=kq+(lp-lt+1);
  End;
 Assign(F,FO); Rewrite(F); writeln(F,kq); Close(F);
 End;


Begin
 Init;
 Try;
End.
