//Cao Nguyet Minh -12Ctin -LHP
Uses math;
Const FI='SUBST.inp';
      FO='SUBST.OUT';

VAR S,T: ANSISTRING;
    A: ARRAY [0..4001,0..4001] OF LONGINT;
    N,M,ANS,I,J: LONGINT;
    F: TEXT;


PROCEdure Init;
 Begin
 Assign(f,FI); Reset(f);
 Readln(f,s);
 Readln(f,t);
 n:=length(s); m:=length(T);
 Close(F);
 End;

Procedure Try;
 Begin
 For i:=1 to n do begin
  For j:=1 to m do
   If s[i]=t[j] then begin a[i,j]:=max(a[i-1,j-1]+1,a[i,j]);
                           ans:=max(ans,a[i,j]); end else a[i,j]:=0;

  End;
 Assign(f,FO); rewrite(F);
 Writeln(F,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.