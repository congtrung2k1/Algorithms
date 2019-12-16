CONST FI='DUADO.INP';
      FO='DUADO.OUT';

VAR N,M: LONGINT;
    A,B: ARRAY [0..300000] OF LONGINT;
    ANS: INT64;
    F: TEXT;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do
 dec(j);
 if not(i>j) then begin
                y:=a[i]; a[i]:=a[j]; a[j]:=y;
                y:=b[i]; b[i]:=b[j]; b[j]:=y;
                inc(i); dec(j);
                  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Init;
 Begin
     Assign(f,FO); Reset(F);
     Readln(f,n,m);
     For n:=1 to n do readln(f,a[n],b[n]);
     Close(F);
 End;


Procedure Try;
 Var i: longint;
 Begin
     Sort(1,n);
     Start:=A[1]; Finish:=B[1];
     For i:=1 to n do
      begin