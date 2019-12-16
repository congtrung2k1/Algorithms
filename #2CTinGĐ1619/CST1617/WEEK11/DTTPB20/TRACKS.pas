CONST FI='TRACKS.INP';
      FO='TRACKS.OUT';

VAR QI,QJ,QK: ARRAY [0..40054000] OF LONGINT;
    A: ARRAY [0..4005,0..4005] OF CHAR;
    visit: ARRAY [0..4005,0..4005] OF BOOLEAN;
    TD: ARRAY [1..4] OF LONGINT =(1,0,-1,0);
    TC: ARRAY [1..4] OF LONGINT =(0,1,0,-1);
    N,M,FRONT,REAR: LONGINT;
    F: TEXT;

Procedure Init;
 Var i,j: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(F,n,m);
 For i:=1 to n do Begin
  For j:=1 to m do read(f,a[i,j]);
  Readln(F);
  End;
 Close(F);
 End;


Procedure DFS(X,Y,K: Longint);
 Var i,x1,y1: Longint;
 Begin
 Visit[X,Y]:=True;
 For i:=1 to 4 do
  Begin
  x1:=X+Td[i]; y1:=y+Tc[i];
  If Visit[X1,Y1] Then Continue;
  If A[x1,y1]=A[x,y] Then DFS(X1,Y1,K)
    Else
     If A[X1,Y1] In ['F','R'] then
     Begin
     Inc(Rear);
     QI[Rear]:=X1;
     QJ[Rear]:=Y1;
     QK[Rear]:=K+1;
     End;
  End;
 End;    {
procedure DFS(i,j,k:longint);
var     u:byte;ii,jj:longint;
begin
        Visit[i,j]:=True;
        for u:=1 to 4 do
        begin
                ii:=i+td[u];jj:=j+tc[u];
                if Visit[ii,jj] then continue;
                if A[i,j]=A[ii,jj] then dfs(ii,jj,k) else
                if A[ii,jj] in ['F','R'] then
                Begin
                Inc(Rear);
                QI[Rear]:=ii;
                QJ[Rear]:=jj;
                QK[Rear]:=K+1;
                 End;
        end;
end;               }


Procedure Try;
 Var UX,UY,Uk,kq: Longint;
 Begin
 Front:=1; Rear:=1; Kq:=0;
 Fillchar(Visit,sizeof(Visit),False);
 QI[1]:=1; QJ[1]:=1; QK[1]:=1;
 Repeat
  Ux:=QI[Front]; Uy:=Qj[Front]; UK:=QK[Front];
  If Kq<UK then Kq:=UK;
  If Not Visit[ux,uy] Then DFS(ux,uy,Uk);
  Inc(Front);
 Until Front>Rear;
 Assign(f,fo); Rewrite(F);
 Writeln(F,KQ);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
