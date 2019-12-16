CONST FI='LIGA.INP';
      FO='LIGA.OUT';

VAR A: ARRAY [0..1005,0..5] OF LONGINT;
    F: TEXT;
    N,I,J,T,TMP,M: LONGINT;
    S: STRING;

Procedure Init;
 Begin
 assign(f,fi); Reset(F);
 Readln(f,n);
 For i:=1 to n do
  Begin
  Readln(f,s);
  m:=Length(S);
  t:=0; J:=1;
  While j<=m do
   Begin
   Case S[J] of
   '?': Begin inc(T); A[i,t]:=-1; End;
   ' ': If tmp<>0 then Begin Inc(t); A[i,t]:=Tmp; Tmp:=0; end;
   end;
   IF S[J] in ['0'..'9'] then tmp:=Tmp*10+ord(s[J])-48;
   Inc(J);
   End;
  If Tmp<>0 then A[i,5]:=tmp else A[i,5]:=-1;
  Tmp:=0;
  End;
 Close(F);
 End;


Procedure Try1;
 Var k: Longint;
 Begin
 If (A[i,4]<>-1) and (a[i,5]<>-1) and (a[i,1]<>-1) then
  Begin
  For k:=(A[i,5] Div 3) downto 0 do
   If (A[i,1]-A[i,4]-K)>=0 then
    If (K*3+A[i,1]-A[i,4]-K=A[i,5]) Then
    Begin A[i,2]:=K; A[i,3]:=A[i,1]-A[i,4]-K; Dec(T,2); Exit; End;
  End;
 End;

Procedure Try;
 Begin
 For i:=1 to n do begin T:=0;
  For j:=1 to 5 do If A[i,j]=-1 then inc(t);
  Repeat
  If (A[i,2]=A[i,3]) and (A[i,2]=-1) then Try1;
  For j:=1 to 5 do begin
   if j=1 then If A[i,1]=-1 then
    If (A[i,4]<>-1) and (A[I,2]<>-1) AND (A[i,3]<>-1) then
     Begin A[i,1]:=A[i,2]+A[i,3]+A[i,4]; dec(t); end;
   If j=2 then If A[i,2]=-1 then
    If (A[i,1]<>-1) and (A[i,3]<>-1) And (A[i,4]<>-1) then
     Begin A[i,2]:=A[i,1]-A[i,3]-A[i,4]; Dec(t); end
     else
     If (A[i,5]<>-1) and (A[i,3]<>-1) then
      Begin A[i,2]:=(A[i,5]-A[i,3]) div 3; Dec(t); end;
   If j=3 then If A[i,3]=-1 then
    If (A[i,1]<>-1) and (A[i,2]<>-1) And (A[i,4]<>-1) then
     Begin A[i,3]:=A[i,1]-A[i,2]-A[i,4]; Dec(t); end
     else
     If (A[i,5]<>-1) and (A[i,2]<>-1) then
      Begin A[i,3]:=A[i,5]-A[i,2]*3; Dec(t); end;
   If j=4 then If a[i,4]=-1 then
    If (a[i,1]<>-1) and (A[i,2]<>-1) And (A[i,3]<>-1) then
     Begin
     A[i,4]:=A[i,1]-A[i,2]-A[i,3]; Dec(T);
     End;
   If j=5 then If A[i,5]=-1 then
    If (a[i,2]<>-1) And (A[i,3]<>-1) then
     Begin
     A[i,5]:=A[i,2]*3+A[i,3]; Dec(T);
     End
   End
  Until T=0;
  End;
 Assign(f,fo); Rewrite(F);
 For i:=1 to n do Begin
  For j:=1 to 5 do
   Write(F,A[i,j],' ');
  Writeln(f);
  End;
 Close(F);
 End;


Begin
 Init;
 Try;
End.
