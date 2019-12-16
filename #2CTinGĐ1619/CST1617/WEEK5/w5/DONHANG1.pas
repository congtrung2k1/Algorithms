Uses Math;
CONST FI='DONHANG.INP';
      FO='DONHANG.OUT';

VAR A,B,FX: ARRAY [0..10005] OF LONGINT;
    S,N,M,D,ANS,MaxA: LONGINT;
    F: TEXT;


PROCEdure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n,d,m);
 For n:=1 to n do begin
  read(f,a[n]);
  MaxA:=max(MaxA,a[n]);
  End;
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x,y,x1: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 x1:=b[(l+r) div 2];
 repeat
 while (b[i]<x1) or ((b[i]=x1) and (a[i]<x)) do inc(i);
 while (b[j]>x1) or ((b[j]=x1) and (a[j]>x)) do dec(j);
 if not(i>j) then begin
                y:=a[i]; a[i]:=a[j]; a[j]:=y;
                inc(i); Dec(j);
             end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Begin
 For i:=1 to n do B[i]:=A[i]+D+1;
 Sort(1,n);
 Repeat
 For i:=1 to n do
  if FX[i]<mini then
   begin mini:=fx[i];
   j:=i;
   end;

 Until False;
 End;

