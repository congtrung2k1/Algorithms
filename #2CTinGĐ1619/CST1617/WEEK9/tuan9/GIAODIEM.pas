Uses Math;
CONST FI='GIAODIEM.INP';
      FO='GIAODIEM.OUT';

TYPE LIST=RECORD
     X,Y: LONGINT;
     End;
VAR A,B,C,D,E,F: LIST;
    N,TEST: LONGINT;
    KT: BOOLEAN;
    FX,G: TEXT;

Operator *(a,b:List)c:extended;
Begin
 c:=a.x*b.y-a.y*b.x;
End;

Operator -(a,b:List)c:List;
Begin
 c.x:=a.x-b.x;
 c.y:=a.y-b.y;
End;

Function CatNhau(A,B,C,D: List): Boolean;
Begin
 Exit((((B-A)*(C-A))*((B-A)*(D-A))<=0)And
      (((D-C)*(A-C))*((D-C)*(B-C))<=0));
End;

Procedure Try;
 Begin
 E.X:=D.X; E.Y:=C.Y;
 F.X:=C.X; F.Y:=D.Y;
 If CatNhau(A,B,C,E) Or Catnhau(A,B,C,F) Or CatNhau(A,B,E,D) or Catnhau(A,B,F,D)
  Then Begin Writeln(g,'T'); Exit; End;
 If (A.x>=C.x) And (A.x<=D.x) And (B.x>=C.x) And (B.x<=D.x) Then
  If (A.y>=D.y) And (A.y<=C.y) And (B.y>=D.y) And (B.y<=C.y) Then
   Begin
   writeln(g,'T'); Exit; End;
 Writeln(g,'F');
 End;

PROCEdure INIT;
 Var x1,x2,y1,y2: Longint;
 Begin
 Assign(fX,fi); Reset(FX);
 Assign(G,fo); Rewrite(G);
 Readln(fX,test);
 For Test:=1 to Test do
  Begin
  Read(fX,A.x,A.y);
  Read(fX,B.x,B.y);
  Read(fX,x1,y1);
  Read(fX,x2,y2);
  C.X:=MIN(x1,x2); D.X:=Max(X1,x2);
  C.y:=Max(y1,y2); D.y:=Min(Y1,Y2);
  Readln(FX);
  Try;
  End;
 Close(FX); Close(G);
 End;

Begin
 Init;
end.


