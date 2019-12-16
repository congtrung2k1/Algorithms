Uses Math;
CONST FI='HINH.INP';
      FO='HINH.OUT';
      INF=TRUNC(10E8);
TYPE LIST= ARRAY[0..45,0..45] OF BOOLEAN;
VAR N,M,TPLT: LONGINT;
    D: ARRAY [0..45,0..45] OF LONGINT;
    TD: ARRAY [1..4] OF LONGINT =(0,0,-1,1);
    TC: ARRAY [1..4] OF LONGINT =(-1,1,0,0);
    MINX,MINY,MAXY,MAXX,Area,Res: ARRAY [0..45*45] OF LONGINT;
    FREE: ARRAY [0..45*45] OF BOOLEAN;
    X,Y: LIST;
    A: ARRAY [0..45,0..45] OF CHAR;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m);
 For n:=1 to n do begin
  For m:=1 to m do Read(f,a[n,m]);
  Readln(F);
  End;
 Close(F);
 End;

Procedure DFS(x,y: Longint);
 Var u,v,i: Longint;
 Begin
 D[x,y]:=TPLT; Inc(Area[TPLT]);
 Maxx[TPLT]:=Max(x,Maxx[TPLT]);
 Minx[TPLT]:=Min(x,Minx[TPLT]);
 Maxy[TPLT]:=Max(y,Maxy[TPLT]);
 Miny[TPLT]:=Min(y,Miny[TPLT]);
 For i:=1 to 4 do
  Begin
  u:=x+td[i]; v:=y+tc[i];
  If D[u,v]=0 Then
   If A[u,v]=A[x,y] Then DFS(u,v);
  End;
 End;

Procedure CodeTrau;
 Var i,j: Longint;
 Begin
 TPLT:=0;
 Fillchar(Maxx,Sizeof(Maxx),0);
 Maxy:=Maxx;
 Fillchar(D,Sizeof(D),0);
 For i:=1 to n do
  For j:=1 to m do
   If D[i,j]=0 Then
    Begin
    Inc(TPLT);
    Minx[TPLT]:=inf;
    Miny[TPLT]:=inf;
    DFS(i,j);
    End;
 Writeln(f,TPLT);
 For i:=1 to n do Begin
  For j:=1 to m do
   Write(f,D[i,j],' ');
  Writeln(F);
  end;
 End;

Procedure XayMang(X: Longint;Var A:List);
 Var i,j: Longint;
 Begin
 Fillchar(A,sizeof(A),False);
 For i:=Minx[x] to Maxx[x] do
  For j:=Miny[x] to Maxy[x] do
   if (D[i,j]=x) then a[i-Minx[x]+1,j-Miny[x]+1]:=true;
 Maxx[x]:=Maxx[x]-Minx[x]+1;
 Maxy[x]:=Maxy[x]-Miny[x]+1;
 End;

Function Same(A,B: List): Boolean;
 Var i,j: Longint;
 Begin
 For i:=1 to n do
  For j:=1 to m do
   IF A[i,j]<>B[i,j] Then Exit(False);
 Exit(True);
 End;

Procedure Xoay(x: Longint;Var A: List);
 Var B: List;
     i,j,tmp: Longint;
 Begin
 Fillchar(B,Sizeof(B),False);
 for i:=1 to Maxx[x] do
  For j:=1 to Maxy[x] do B[Maxy[x]-j+1,i]:=A[i,j];
 Fillchar(A,sizeof(A),False);
 A:=B;
 Tmp:=Maxx[x]; Maxx[x]:=Maxy[x]; Maxy[x]:=Tmp;
 End;

Procedure CungAC;
 Var TPLT2,i,j,k: Longint;
 Begin
 TPLT2:=0;
 Fillchar(Free,sizeof(Free),True);
 For i:=1 to TPLT-1 do
  If Free[i] Then
   Begin
   Inc(TPLT2); Free[i]:=False;
   XayMang(i,X);
   Res[i]:=TPLT2;
   For j:=i+1 to TPLT do
    IF Area[i]=Area[j] Then Begin
     XayMang(j,Y);
     If Same(X,Y) Then Begin Free[j]:=False; Res[j]:=TPLT2; End
      Else
      For k:=1 to 3 do
       Begin
       Xoay(i,X);
       If Same(X,Y) Then Begin Free[j]:=False; Res[j]:=TPLT2; Break; End;
       End;
     End;
   End;
 Writeln(f,TPLT2);
 For i:=1 to n do Begin
  For j:=1 to m do Write(F,Res[D[i,j]],' ');
  Writeln(F);
  End;
 For i:=1 to TPLT do Write(f,Area[i],' ');
 End;

Begin
 Init;
 Assign(f,fo); Rewrite(F);
 CodeTrau;
 CungAC;
 Close(F);
End.

