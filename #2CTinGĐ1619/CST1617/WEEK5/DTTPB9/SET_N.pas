CONST FI='SET_N.INP';
      FO='SET_N.OUT';
      NMAX=31;
VAR C: ARRAY [-1..32,-1..32] OF INT64;
    I,J,N: LONGINT;
    K,ANS: INT64;
    F,G: TEXT;

Procedure Try;
 Begin
 For j:=0 to n do if k>c[n,j] then k:=k-c[n,j] else break;
 ans:=1;
 For i:=n downto 1 do
  begin
  if k>c[i-1,j-1] then
   begin
   ans:=ans*2+1;
   k:=k-c[i-1,j-1];
   end
   else
   begin
   ans:=ans*3+1;
   dec(j);
   End;
  End;
 Writeln(G,Ans);
 End;

Procedure Init;
 Begin
 Assign(F,FI); Reset(F);
 Assign(g,FO); Rewrite(G);
 While not eof(f) do
  begin
  Readln(f,n,k);
  Try;
  End;
 Close(F); Close(G);
 End;

Procedure Khoitao;
 Begin
 C[0,0]:=1;
 For i:=1 to nmax do begin
  C[i,0]:=1;
  For j:=1 to i do c[i,j]:=c[i-1,j]+c[i-1,j-1];
  end;
 End;

Begin
 Khoitao;
 Init;
End.
