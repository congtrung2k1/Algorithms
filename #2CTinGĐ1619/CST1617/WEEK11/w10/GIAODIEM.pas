CONST FI='GIAODIEM.INP';
      FO='GIAODIEM.OUT';
TYPE POINT= RECORD X,Y: LONGINT; END;
     LINE= RECORD P1,Q1: POINT; END;

VAR A,B,C,D,X,Y: POINT;
    TEST: LONGINT;
    F,G: TEXT;


Function CCW(A,B,C: Point): Longint;
 Var Dx1,Dx2,Dy1,Dy2,D: Longint;
 Begin
 Dx1:=B.x-A.x; Dy1:=B.y-A.y;
 Dx2:=C.x-A.x; Dy2:=C.y-A.y;
 D:=Dx1*Dy2-Dx2*Dy1;
 If D>0 then exit(1);
 If D<0 then Exit(-1);
 If D=0 then
  Begin
  If (Dx1*Dx2<0) Or (Dy1*Dy2<0) Then Exit(1)
   Else If ((Dx1*Dx1+Dy1*Dy1)>=(Dx2*Dx2+Dy2+Dy2)) Then Exit(-1)
    Else Exit(0);
  End;
 End;

Function CatNhau(A,B,C,D: Point): Boolean;
 Begin
 Catnhau:=((CCW(A,B,C)*CCW(A,B,D))<=0) And ((CCW(C,D,A)*(CCW(C,D,B))<=0));
 End;

Function Try:Boolean;
 Begin
 If CatNhau(A,B,X,Y) Then Exit(True);
 If CatNhau(A,C,X,Y) Then Exit(True);
 If CatNhau(B,C,X,Y) Then Exit(True);
 If CatNhau(C,D,X,Y) Then Exit(True);
 If (X.x>=A.x) And (Y.x>=A.x) And (X.x<=D.X) And (Y.x<=D.x) And
  (X.y>=D.y) And (Y.Y>=D.y) And (X.y<=A.y) And (Y.Y<=A.y) Then
   Exit(True);
 Exit(False);
 End;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  Read(f,A.x,A.y); Read(f,D.x,D.y);
  B.X:=D.X; B.Y:=A.Y;
  C.X:=A.X; C.Y:=D.Y;
  Readln(f,X.x,x.y,Y.x,y.y);
  If Try Then Writeln(g,'T') Else Writeln(G,'F');
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.
