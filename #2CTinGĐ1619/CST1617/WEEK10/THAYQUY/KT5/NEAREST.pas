//CAO NGUYET MINH - TEAM 1
Uses math;
CONST FI='NEAREST.INP';
      FO='NEAREST.OUT';
TYPE LIST= RECORD
     X,Y: LONGINT;
     D:REAL;
     END;

VAR N,XMA,YMA,I,J: LONGINT;
    A: ARRAY [0..50005] OF LIST;
    F: TEXT;

PROCEDURE Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to n do
  With A[i] do Begin
  Readln(F,x,y);
  xma:=Max(Xma,x);
  yma:=Max(yma,y);
  End;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j: longint;
     y: list;
     x: extended;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2].d;
 repeat
 while a[i].d<x do inc(i);
 while x<a[j].d do dec(j);
 if not(i>j) then
  begin
  y:=a[i];
  a[i]:=a[j];
  a[j]:=y;
  Inc(i); Dec(j);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Var x:Longint;
     d,tmp: REAL;
 Begin
 Inc(xma); inc(yma);
 For i:=1 to n do
  Begin
  A[i].D:=abs(Sqr(Xma-a[i].x));
  A[i].D:=A[i].D+abs(sqr(yma-A[i].y));
  A[i].D:=SQRT(A[i].D);
  End;
 Sort(1,n); x:=2000; d:=maxlongint;
 For i:=1 to n do
  For j:=i+1 to Min(x+i,n) do begin
   tmp:=abs(Sqr(a[j].x-a[i].x));
   tmp:=tmp+abs(sqr(a[j].y-A[i].y));
   tmp:=SQRT(tmp);
   D:=Min(D,tmp);
   End;
 Assign(f,fo); Rewrite(F);
 WRiteln(f,D:0:6);
 Close(F);
 End;



Begin
 Init;
 Try;
End.
