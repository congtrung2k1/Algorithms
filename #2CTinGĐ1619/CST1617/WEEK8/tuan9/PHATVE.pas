USES MATH;
CONST FI='PHATVE.INP';
      FO='PHATVE.OUT';
Type List=RECORD
     X1,X2,Y1,Y2: LONGINT;
     End;

VAR A: ARRAY [1..400000] OF RECORD X,Y,P: LONGINT; END;
    HCN: ARRAY [1..400000] OF LIST;
    N,ANS,D,I: LONGINT;
    A2,A3: LIST;
    F: TEXT;


PROCEDURE Init;
 Begin
 assign(f,FI); Reset(F);
 Readln(f,n);
 For n:=1 to n do
  with a[n] do readln(f,x,y,p);
 For n:=1 to n do
  begin
  HCN[n].X1:=A[n].x-A[n].p;
  HCN[N].X2:=A[N].X+A[N].P;
  HCN[N].Y1:=A[N].Y-A[N].P;
  HCN[N].Y2:=A[N].Y+A[N].P;
  END;
 Close(F);
 End;

Procedure TimD(X,Y:LIST);
 Begin
 D:=0;
 D:=MAX(0,MAX(X.X1-Y.X2,Y.X1-X.X2));
 D:=MAX(D,MAX(X.Y1-Y.Y2,Y.Y1-X.Y2));
 END;

Procedure CONGHCN(X:LIST;Y: LONGINT);
 BEGIN
 DEC(A2.X1,Y);
 DEC(A2.Y1,Y);
 INC(A2.Y2,Y);
 INC(A2.X2,Y);
 END;

Procedure TIMHCN(X,Y:LIST);
 BEGIN
 A3.X1:=MAX(X.X1,Y.X1);
 A3.X2:=MIN(X.X2,Y.X2);
 A3.Y1:=MAX(X.Y1,Y.Y1);
 A3.Y2:=MIN(X.Y2,Y.Y2);
 END;

Procedure Try;
 Begin
 Ans:=0;
 A2:=HCN[1];
 For i:=2 to n do
  Begin
  TimD(A2,HCN[I]);
  CONGHCN(A2,D);
  TIMHCN(A2,HCN[I]);
  A2:=A3;
  Inc(ans,D);
  End;
 Assign(f,FO); Rewrite(F);
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.



