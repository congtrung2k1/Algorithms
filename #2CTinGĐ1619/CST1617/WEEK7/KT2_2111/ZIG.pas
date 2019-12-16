//CAO NGUYET MINH - LHP - 12CTIN
USES MATH;
CONST FI='ZIG.INP';
      FO='ZIG.OUT';

VAR N,K,ANS: LONGINT;
    A: ARRAY [0..2,0..5000] OF LONGINT;
    TD : ARRAY [1..3] OF LONGINT =(-1,1,0);
    TC : ARRAY [1..3] OF LONGINT =(0,0,1);
    F: TEXT;
    Q1,Q2,Q3,Q4: ARRAY [0..250000] OF LONGINT;
    D: ARRAY [0..100000] OF LONGINT;
    FREE: ARRAY [0..5005,0..5005] OF BOOLEAN;
    Front,Rear: Longint;

Procedure Init;
 Var i,j: longint;
 Begin
 assign(f,fI); Reset(F);
 readln(f,n,k);
 for i:=1 to 2 do begin
  for j:=1 to n do
   Read(f,a[i,j]);
  readln(F);
  end;
 Close(F);
 End;

Function Check(x,y: Longint): Boolean;
 Begin
 Exit((X>=1) And (X<=2) And (Y>=1) And (Y<=N));
 end;

Procedure Update(x,y,b,h: Longint);
 Begin
 Inc(Rear);
 Q1[rear]:=x; Q2[Rear]:=y; Q3[rear]:=b; Q4[rear]:=h;
 End;

Procedure BFS;
 Var u1,u2,k1,h1,d1,I: Longint;
 Begin
 Front:=1; Rear:=1;
 Fillchar(Free,sizeof(free),True);
 D[1]:=A[1,1];
 Q1[1]:=1; Q2[1]:=1; //Q4[1]:=1;
 Repeat
  u1:=Q1[front]; u2:=Q2[front];
  k1:=Q3[Front]; H1:=Q4[Front]; D1:=D[FRONT];
  Inc(front); Free[u1,u2]:=False;
  If (K1<K) And (K1<>0) Then
   If Check(U1+TD[H1],U2+TC[H1]) Then
    If Free[U1+TD[H1],U2+TC[H1]] THEN
   {  IF D[U1+TD[H1],U2+TC[H1]]<D[U1,U2]+A[U1+TD[H1],U2+TC[H1]] THEN   }
      BEGIN
       D[REAR+1]:=D1+A[U1+TD[H1],U2+TC[H1]];
       IF (U1+TD[H1]=2) AND (U2+TC[H1]=N) THEN ANS:=MAX(ANS,D[REAR+1]);
       UpDate(U1+TD[H1],U2+TC[H1],K1+1,H1);
      eND;
  For i:=1 to 3 do
   If (i<>h1) or (h1=0) then
   IF Check(U1+TD[I],U2+TC[I]) Then
    If Free[U1+TD[I],U2+TC[I]] THEN
    { Begin
     IF D[U1+TD[I],U2+TC[I]]<D[U1,U2]+A[U1+TD[I],U2+TC[I]] THEN  }
      BEGIN
      D[REAR+1]:=D1+A[U1+TD[I],U2+TC[I]];
      IF (U1+TD[I]=2) AND (U2+TC[I]=N) THEN ANS:=MAX(ANS,D[REAR+1]);
      UpDate(U1+TD[I],U2+TC[I],1,I);
      eND;
 Until Front>rear;
 Assign(f,FO); Rewrite(F);
 Writeln(F,Ans);
 Close(F);
 End;

Begin
 Init;
 BFS;
end.
