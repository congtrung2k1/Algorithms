//CAO NGUYET MINH
Uses math;
Const FI='GAME.INP';
      FO='GAME.OUT';

VAR S: ARRAY [0..251,0..251,0..251] OF LONGINT;
    A: ARRAY [0..3] OF LONGINT;
    N,M,K,ANS,I,J,U,TMP,ANS1: LONGINT;
    F: TEXT;


PROCEDUre INIT;
 BEGIN
 ASSIGN(F,FI); Reset(F);
 Readln(f,N,M,K);
 Close(F);
 End;

Function ss(x,y,z:longint):boolean;
 Begin
 IF (x=y) and (y=z) and (s[x,y,z]<>0) then exit(true);
 Exit(False);
 End;


Procedure Try1;
 Begin
 ans1:=0;
 a[1]:=n; a[2]:=m; a[3]:=k;
 IF (a[1]=a[2]) and (a[2]=a[3]) then begin ans1:=1; exit; end;
 Repeat
 For i:=1 to 3 do
  For j:=1 to 3 do
   if a[i]>a[j] then begin
    tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp; end;
 If a[1]=a[2] then a[1]:=a[1]-a[3] else a[1]:=a[1]-a[2];
  inc(ans1);
 Until (a[1]=a[2]) and (a[2]=a[3]);
 End;

PRocedure Try;
 Begin
 ans:=10000000;
 If (n=m) and (m=k) then begin ans:=0; exit; end;
 For i:=1 to n do
  For j:=1 to m do
   For u:=1 to k do
    s[i,j,u]:=10000000;
 s[n,m,k]:=0;
 For i:=n downto 1 do
  For j:=m downto 1 do begin
   For u:=k downto 1 do
    begin
    if i>j then begin s[i-j,j,u]:=min(s[i-j,j,u],s[i,j,u]+1);
     if ss(i-j,j,u) then begin ans:=min(ans,s[i-j,j,u]);  end end
     else
      if i<j then begin s[i,j-i,u]:=min(s[i,j-i,u],s[i,j,u]+1);
       if ss(i,j-i,u) then begin ans:=min(ans,s[i,j-i,u]);  end end;
    if i>u then begin s[i-u,j,u]:=min(s[i-u,j,u],s[i,j,u]+1);
     if ss(i-u,j,u) then begin ans:=min(ans,s[i-u,j,u]);  end end
      else
       if i<u then begin s[i,j,u-i]:=min(s[i,j,u-i],s[i,j,u]+1);
        if ss(i,j,u-i) then begin ans:=min(ans,s[i,j,u-i]);  end end;
    if j>u then begin s[i,j-u,u]:=min(s[i,j-u,u],s[i,j,u]+1);
      if ss(i,j-u,u) then begin ans:=min(ans,s[i,j-u,u]);  end end
       else
        if j<u then begin s[i,j,u-j]:=min(s[i,j,u-j],s[i,j,u]+1);
         if ss(i,j,u-j) then begin ans:=min(ans,s[i,j,u-j]); end end
     end;
    end;
 End;

 PRocedure Outp;
 Begin
 Assign(F,fO); Rewrite(F);
 Writeln(f,ans);
 Close(F);
 End;

Begin
 Init;
 Try;
 TRy1;
 Outp;
End.
