Const Fi = 'ROBOMOVE.Inp';
      Fo = 'ROBOMOVE.Out';

Var Ax, Ay, VtDx, VtDy, VtCx, VtCy : Array [0..10005] of Longint;
    Row, Col, N, D, C : Longint;
    F: Text;

Procedure Init;
Var i : Longint;
    C : Char;
Begin
 Assign(F,FI); Reset(F);
 Readln(F, Row, Col); Readln(F, N);
 For i:=1 to N do
  Begin
  Read(F, C);
  Case Upcase(C) of
   'U': Begin Ax[i] := 0;  Ay[i] := 1;  End;
   'D': Begin Ax[i] := 0;  Ay[i] := -1; End;
   'L': Begin Ax[i] := -1; Ay[i] := 0;  End;
   'R': Begin Ax[i] := 1;  Ay[i] := 0;  End;
   End;
  End;
 For i:=1 to N do
  Begin
  VtDx[i] := VtDx[i-1] + Ax[i];
  VtDy[i] := VtDy[i-1] + Ay[i];
  VtCx[N-i+1] := VtCx[N-i+2] + Ax[N-i+1];
  VtCy[N-i+1] := VtCy[N-i+2] + Ay[N-i+1];
  End;
End;

Function Check (a,b : Longint) : Boolean;
 Begin
 Exit((a>=0) and (b>=0) and (a<=Row) and (B<=Col));
 End;

Procedure Try;
Var i,j,s,t,Tmp,min,u,v: Longint;
 Begin
 i := 0; Min :=Maxlongint;
 u := 0; v := 0;
 While Check(VtDx[i], VtDy[i]) and (i <= N) do
  Begin
  j := N+1;
  While Check(VtDx[i] + VtCx[j], VtDy[i] + VtCy[j]) and (j >i) do
   Begin
   Tmp := Row-(VtDx[i] + VtCx[j]) + Col-(VtDy[i] + VtCy[j]);
   If Tmp < Min then Begin Min := Tmp; u := i+1; v := j-1; End;
   Dec(j);
   End;
  Inc(i);
  End;
  If u > v then Begin u := 0; v := 0; End;
  Assign(f,FO); Rewrite(F);
  Writeln(F, Min); Writeln(F, u,' ',v);
  Close(F);
End;

Begin
 Init;
 Try;
End.
