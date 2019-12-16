USES MATH;
CONST FI='SELECT.INP';
      FO='SELECT.OUT';

VAR S: ARRAY [1..8] OF LONGINT=(0,1,2,4,5,8,9,10);
    T: ARRAY [0..10000,1..8] OF LONGINT;
    A: ARRAY [0..10000,1..4] OF LONGINT;
    I,J,K,N,RES,TAM: LONGINT;
    F: TEXT;


PROCEDURE Init;
 Begin
 Assign(f,FI); REset(F);
 Readln(F,n);
 For i:=1 to 4 do
  For j:=1 to n do read(f,a[J,I]);
 Close(F);
 End;

Function Getbit(x,y: longint):byte;
 BEgin
 Getbit:=(x shr y) and 1;
 End;

Procedure Try;
 Begin
 For i:=1 to n do
  For j:=1 to 8 do
   Begin
   Tam:=0;
   For k:=1 to 4 do Tam:=tam+GetBit(s[j],k-1)*a[i,k];
   For k:=1 to 8 do
    If (s[j] and S[k] =0)  and (t[i-1,k]+tam>t[i,j])
     then T[i,j]:=t[i-1,k]+tam;
   End;
 Res:=-Maxlongint;
 For i:=1 to 8 do res:=max(res,T[n,i]);
 End;


Procedure INKQ;
 Begin
 Assign(F,Fo); Rewrite(F);
 Tam:=-maxlongint;
 For i:=1 to n do
  For j:=1 to 4 do tam:=Max(tam,a[i,j]);
 If tam<=0 then write(f,tam) else writeln(f,Res);
 Close(F);
 End;


Begin
 Init;
 Try;
 Inkq;
End.

