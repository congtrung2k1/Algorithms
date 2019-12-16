USES MATH;
CONST FI='VOLLEY.INP';
      FO='VOLLEY.OUT';

VAR N,P,Q,I,KQ,ANS1,ANS2: LONGINT;
    A,SUM: ARRAY [0..100006] OF LONGINT;
    KT: BOOLEAN;
    F: TEXT;


PROCEDURE INIT;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n);
 Sum[0]:=0;
 For n:=1 to n do Read(f,A[n]);
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]>x do inc(i);
 while x>a[j] do dec(j);
 if not(i>j) then
  begin
  y:=a[i];
  a[i]:=a[j];
  a[j]:=y;
  inc(i); dec(j);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;


Function Check(P: Longint):Longint;
 Var S1,S2,TMP: Longint;
 Begin
 i:=0;
 Tmp:=kq;
 For Q:=P TO N-P do
 Begin
 Kt:=False; S1:=0; S2:=0; I:=0;
 Repeat
 If Not KT Then Begin S1:=S1+Sum[Min(i+P,n)]-Sum[i]; I:=Min(I+P,n); End
  Else Begin S2:=S2+Sum[Min(i+Q,n)]-Sum[i]; I:=Min(I+Q,N); End;
 KT:= Not Kt;
 Until I>=n;
 If Abs(s2-s1)<tmp Then Begin Ans1:=P; Ans2:=Q; Tmp:=Abs(s2-s1); End;
 END;
 Check:=Tmp;
 End;

Procedure Try;
 Var L,R,M: Longint;
 Begin
 L:=1; R:=n; KQ:=MAXLONGINT;
 Sort(1,n);
 For i:=1 to n do Sum[i]:=Sum[i-1]+A[i];
 Repeat
 M:=(L+R) Div 2;
 If Check(m)>Kq Then Begin Kq:=Check(m); L:=M; End
  Else R:=M;
 Until (L=M) And (R=M);
 Assign(f,fO); REwrite(F);
 Writeln(f,ANS1,' ',ANS2);
 Close(F);
 End;


Begin
 Init;
 Try;
end.
