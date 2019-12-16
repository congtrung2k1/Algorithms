CONST FI='IZO.INP';
      FO='IZO.OUT';
VAR A: ARRAY [0..100005] OF LONGINT;
    SUM,N: LONGINT;
    F: TEXT;


Procedure Init;
 Var i : Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to n do Readln(f,A[i]);
 Close(F);
 End;

procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do dec(j);
 if not(i>j) then
  begin
  y:=a[i]; a[i]:=a[j]; a[j]:=y;
  inc(i); dec(j);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Var i,j: Longint;
 Begin
 Sort(1,n);
 i:=1; j:=n;
 Repeat
 Sum:=Sum+A[i]+A[j]+A[j]-A[i];
 Inc(i); Dec(j);
 Until i>=j;
 If i=j then sum:=Sum+A[i];
 Assign(f,fo); Rewrite(F);
 Writeln(f,Sum);
 Close(F);
 end;


Begin
 Init;
 Try;
end.