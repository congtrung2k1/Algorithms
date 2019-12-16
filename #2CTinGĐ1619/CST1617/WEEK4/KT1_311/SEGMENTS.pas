//CAO NGUYET MINH
Const
    fi='SEGMENTS.INP';
    fo='SEGMENTS.OUT';
Var
    g,f : Text;
    N,i,j,top : LongInt;
    A,B,VT,Ans,Stack : Array[0..100005] of LongInt;

Procedure Init;
 Begin
 Assign(f,fi); Reset(f);
 Readln(f,N);
 For i:=1 to N do Begin Readln(f,A[i],B[i]); VT[i]:=i; End;
 Close(f);
 End;

Procedure Swap(Var x,y: longint);
 Var tmp: longint;
 Begin
 Tmp:=x; x:=y; y:=tmp;
 End;

Procedure QSort (l,r : LongInt);
 Var i1,j1,x,m,y : LongInt;
 Begin
 if l>=r then exit;
 i1:=l; j1:=r; m:=(l+r) div 2;
 x:=A[m]; y:=B[m];
 Repeat
 While (A[i1]<x) or ((A[i1]=x) and (B[i1]>y)) do inc(i1);
 While (A[j1]>x) or ((A[j1]=x) and (B[j1]<y)) do dec(j1);
 if i1<=j1 then Begin
                    Swap(A[i1],A[j1]);
                    Swap(B[i1],B[j1]);
                    Swap(VT[i1],VT[j1]);
                    inc(i1);
                    dec(j1);
                End;
 Until i1>j1;
 QSort(l,j1); QSort(i1,r);
 End;

Procedure Try;
 Begin
 QSort(1,N);
 top:=0; VT[0]:=0; Stack[0]:=0;
 For i:=1 to N do Begin
  While (top>0) and ((A[i]<A[Stack[top]]) or (B[i]>B[Stack[top]])) do
   dec(top);
  Ans[VT[i]]:=VT[Stack[top]];
  inc(top);
  Stack[top]:=i;
  End;
 End;

Procedure Outp;
 Begin
 Assign(g,fo); Rewrite(g);
 For i:=1 to N do Writeln(g,Ans[i]);
 Close(g);
 End;

Begin
 Init;
 Try;
 Outp;
End.
