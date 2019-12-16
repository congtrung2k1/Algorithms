CONST FI='SSEQ.INP';
      FO='SSEQ.OUT';


VAR N: LONGINT;
    A,BI,BD,Sumi,Sumd: ARRAY [0..50005] OF LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 For n:=1 to n do Read(f,A[n]);
 Close(F);
 End;


Procedure Try;
 Var H,VT,ANS,I,J: Longint;
 Begin
 H:=A[1];
 For i:=2 to n do
  If A[i]<H then Begin BI[i]:=H-A[I]; Sumi[i]:=Sumi[i-1]+Bi[i]; End
   Else Begin H:=a[i]; Sumi[i]:=Sumi[i-1]; End;
 H:=A[n];
 For i:=n-1 downto 1 do
  If A[i]<H then Begin Bd[i]:=H-A[I]; Sumd[i]:=Sumd[i+1]+Bd[i]; End
   Else Begin H:=a[i]; Sumd[i]:=Sumd[i+1]; End;
 If sumi[n]<Sumd[1] then Begin Ans:=Sumi[n]; VT:=n; End
  Else Begin Ans:=Sumd[1]; VT:=0; End;
 For i:=2 to n-1 do
  If Sumi[i]+Sumd[i+1]<Ans then
   Begin
   Ans:=Sumi[i]+Sumd[i+1];
   VT:=i;
   end;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Ans);
 For i:=1 to VT do Write(f,BI[i],' ');
 For i:=VT+1 to n do Write(f,BD[i],' ');
 Close(F);
 End;




Begin
 Init;
 Try;
End.
