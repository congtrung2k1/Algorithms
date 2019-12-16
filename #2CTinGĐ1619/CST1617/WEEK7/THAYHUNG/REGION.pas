Uses math;
Const
    fi='REGION.INP';
    fo='REGION.OUT';
Var
    g,f : Text;
    Reg,Maxi,Score : Array[0..100001] of LongInt;
    N,M,i,j,tmp,base,med,t,re,kq : LongInt;

Procedure INIT;
 Begin
 Assign(f,fi); Reset(f);
 Readln(f,N,M,tmp);
 tmp:=0;
 base:=0;
 For i:=1 to N do
  Begin
  Readln(f,t,re,j,med);
  if med=1 then
   Begin
   Maxi[re]:=-1;
   inc(base);
   continue;
   End;
   inc(tmp);
   Score[tmp]:=j;
   Reg[tmp]:=re;
   if Maxi[re]=-1 then continue;
   Maxi[re]:=max(Maxi[re],j);
  End;
  N:=tmp;
  Close(f);
 End;


Procedure Swap(Var X,Y: Longint);
 Var Tmp: Longint;
 Begin
 Tmp:=X; X:=Y; Y:=Tmp;
 End;

Procedure QSort (l,r : LongInt);
 Var i1,j1,x : LongInt;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r;
 x:=Score[l+Random(r-l+1)];
 Repeat
 While (Score[i1]<x) do inc(i1);
 While (Score[j1]>x) do dec(j1);
 if i1<=j1 then  Begin
                    Swap(Score[i1],Score[j1]);
                    Swap(Reg[i1],Reg[j1]);
                    inc(i1);
                    dec(j1);
                 End;
 Until i1>j1;
 QSort(l,j1); QSort(i1,r);
 End;

Function Try : LongInt;
 Begin
 Randomize;
 QSort(1,N);
 For i:=1 to N do
  Begin
  if Score[i]=Maxi[Reg[i]] then
   Begin
   inc(base);
   Maxi[Reg[i]]:=-1;
   End;
 if (N-i+base=M) then exit(Score[i]+1);
  End;
 End;

Procedure Outp;
 Begin
 Assign(g,fo); Rewrite(g);
 kq:=Try;
 Write(g,kq);
 Close(g);
 End;

Begin
 Init;
 Outp;
End.

