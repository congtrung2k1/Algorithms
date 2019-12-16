CONST FI='KHUYENMAI.INP';
      FO='KHUYENMAI.OUT';

VAR Fx,P,X,D,MINSIZE,MAXSIZE: ARRAY [0..2005] OF LONGINT;
    FREE: ARRAY [0..2005] OF BOOLEAN;
    N,M: LONGINT;
    F: TEXT;


Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m);
 For i:=0 to n-1 do Begin Read(f,X[i]); Dec(X[i]); end;
 Close(F);
 End;

Procedure DFS(A: Longint);
 VAR B: LONGINT;
 Begin
 Free[A]:=False;
 B:=X[A];
 P[A]:=A;
 If not Free[B] Then MinSize[A]:=1+(D[A]-D[B])
  Else Begin
   If D[b]=0 then Begin D[B]:=D[A]+1; DFS(B); End;
   P[A]:=P[B];
   End;
 Inc(MaxSize[P[A]]);
 Free[A]:=True;
 End;

Procedure Try;
 Var i,j,k: Longint;
 Begin
 Fillchar(Free,Sizeof(Free),True);
 Fillchar(D,Sizeof(D),0);
 For i:=0 to n-1 do If D[i]=0 then DFS(i);
 Fx[0]:=1;
 For i:=0 to n-1 do
  If p[i]=i then if MaxSize[i]<>0 then
   For j:=n downto 0 do
    If Fx[j]=1 then
     For k:=MinSize[i] to MaxSize[i] do Fx[j+k]:=1;
 I:=M;
 While (Fx[i]=0) do Dec(i);
 Assign(f,fo); Rewrite(F);
 Writeln(F,I);
 Close(F);
 end;



Begin
 Init;
 Try;
End.
