USES MATH;
CONST FI='RFID.INP';
      FO='RFID.OUT';
Type List =Record
     x,y: Longint; End;

VAR S,R,W,P,TEST: LONGINT;
    SX,SY,ANX,ANY: ARRAY [0..250001] OF LONGINT;
    BX,BY,EX,EY: ARRAY [0..15] OF LONGINT;
    PX,PY: ARRAY [0..10005] OF LONGINT;
    A,B,C,D: LIST;
    F,G: TEXT;

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

Function Len(a:List): Extended;
Begin
 Exit((sqrt(sqr(a.x)+sqr(a.y))));
End;

Procedure Try;
 Var i,j,k,Ans: Longint;
     L,X: Extended;
 Begin
 For i:=1 to P do Begin
  Ans:=0;
  For j:=1 to S do
   Begin
   A.x:=Px[i]-Sx[j];
   A.y:=Py[i]-Sy[j];
   If Len(A)>R Then Continue;
   L:=Len(A);
   C.X:=Min(Sx[j],Px[i]); C.y:=Min(Sy[j],Py[i]);
   D.X:=Max(Px[i],Sx[j]); D.y:=Max(Py[i],Sy[j]); X:=0;
   For k:=1 to w do
    Begin
    A.x:=Min(Ex[k],Bx[k]); A.y:=Min(Ey[k],By[k]);
    B.x:=Max(Bx[k],Ex[k]); B.y:=Max(By[k],Ey[k]);
    If Catnhau(A,B,C,D) Then x:=x+1;
    End;
   If L-X<=R then Begin
    Inc(Ans);
    AnX[Ans]:=Sx[j]; AnY[Ans]:=Sy[j];
    End;
   End;
  If Ans>0 then Begin
   Write(g,ans,' ');
   For Ans:=1 to Ans do Write(G,'(',AnX[Ans],',',AnY[Ans],') ');
   writeln(g);
   end else writeln(g,ans);
 end;
 End;


Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,Test);
 For Test:=1 to Test do
  Begin
  Readln(f,S,R,W,P);
  For S:=1 to S do Readln(f,Sx[S],Sy[S]);
  For W:=1 to W do Readln(f,BX[W],BY[W],EX[W],EY[W]);
  For P:=1 to P do Readln(f,Px[p],Py[p]);
  Try;
  End;
 Close(F); Close(G);
 end;

Begin
 Init;
end.
