//CAO NGUYET MINH C02
Const FI='WORDPOW.INP';
      FO='WORDPOW.OUT';

VAR F: text;
    a,b: array [1..1000] of ansistring;
    c: array [1..1000] of longint;
    s1,s2: ansistring;
    n,m,nn,mm,i,j: longint;


Procedure Init;
 Begin
 Assign(f,FI); Reset(F);
 Readln(f,n,m);
 For n:=1 to n do a[n]:='';
 for m:=1 to m do b[m]:='';
 For n:=1 to n do readln(f,a[n]);
 For m:=1 to m do readln(f,b[m]);
 Close(F);
 End;

Function Check(s1,s2: ansistring): boolean;
 Var nn,mm,dem,i,j: longint;
 Begin
 nn:=length(s1);
 mm:=length(s2);
 i:=1; j:=1;
 Repeat
 If s1[i]=s2[j] then inc(j);
 inc(i);
 Until (i>nn) or (j>mm);
 If j=mm+1 then exit(true) else exit(false);
 End;

Procedure Try;
 Begin
 For i:=1 to n do begin
  s1:=''; s1:=a[i];
  For j:=1 to length(s1) do s1[j]:=upcase(s1[j]);
  a[i]:=s1;
  end;
 For i:=1 to m do begin
  s1:=b[i];
  For j:=1 to length(s1) do s1[j]:=upcase(s1[j]);
  b[i]:=s1;
  end;
 For i:=1 to n do
  for j:=1 to m do
  if check(a[i],b[j]) then inc(c[i]);
 Assign(F,FO); Rewrite(F);
 For i:=1 to n do writeln(f,c[i]);
 Close(F);
 End;


Begin
 Init;
 Try;
End.



