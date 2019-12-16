//Cao Nguyet Minh - LHP - 12CTIN
Uses math;
Const
    fi='KHONGAM.INP';
    fo='KHONGAM.OUT';
    inf=1000000001;
Var g,f : Text;
    N,i,j,t,kq,tmp : LongInt;
    A,Mini   : Array[0..1000001] of LongInt;

Begin
 Assign(f,fi); Reset(f);
 Assign(g,fo); Rewrite(g);
 Repeat
  Readln(f,N); t:=0;
  if N=0 then break;
  Mini[0]:=inf;
  For i:=1 to N do Begin
                Read(f,A[i]); inc(t,A[i]); Mini[i]:=min(Mini[i-1],t);
                End;
  Readln(f);
  kq:=0;
  t:=0;
  tmp:=inf;
 For i:=N downto 1 do
   Begin
   Tmp:=min(tmp+A[i],A[i]);
   inc(t,A[i]);
   if ((tmp>=0) and (Mini[i-1]+t>=0)) then inc(kq);
   End;
 Writeln(g,kq);
 Until false;
 Close(g); Close(f);
End.

