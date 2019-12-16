USES MATH;
CONST FI='LYRA.INP';
      FO='LYRA.OUT';
Type List=ARRAY [0..100000] OF LONGINT;

VAR S1,S2: ANSISTRING;
    A,B: LIST;
    I,LEVEL,LEVELA,LEVELB: LONGINT;
    RES,DELTA: INT64;
    F: TEXT;


Procedure Nho(Var X: List; N: Longint);
 Begin
 X[n-1]:=X[n-1]+x[n] div 2;
 If X[n] mod 2 =-1 then Dec(X[n-1]);
 X[N]:=Abs(X[n]) Mod 2;
 End;

Procedure ChuyenDoi(S: AnsIString; VAR X: List;vAR Len: Longint);
 Var N,I,R: Longint;
 Begin
 N:=Length(S); Len:=1;
 X[0]:=1;
 For i:=1 to N do
  Begin
  Case S[i] Of
  '1': Begin X[Len]:=0; Inc(Len);End;
  '2': Begin X[Len]:=1; Inc(Len);End;
  'L': Dec(X[Len-1]);
  'R': Inc(X[Len-1]);
  'U': Begin Nho(X,Len-1); Dec(Len); End;
  End;
  End;
 For i:=Len-1 Downto 1 do Nho(X,i);
 R:=0; While X[r]=0 do inc(R);
 For i:=r to Len-1 do X[i-r]:=X[i];
 Len:=Len-r;
 End;

Procedure Init;
 Begin
 Assign(f,fI); Reset(F);
 Readln(f,S1); Chuyendoi(S1,A,LevelA);
 Readln(f,S2); Chuyendoi(s2,B,LevelB);
 Close(F);
 End;


Procedure Try;
 Begin
  Level:=Min(LevelA,LevelB);
 Res:=1 Shl 20;
 Delta:=0;
 for i:=0 to Level-1 do
  If Delta<(1 Shl 20) then
   Begin
   Delta:=Delta*2+A[i]-B[i];
   Res:=Min(Res,Abs(Delta)+2*(Level-i-1));
   End;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Res+Abs(LevelA-LevelB));
 Close(F);
 end;

Begin
 Init;
 Try;
End.
