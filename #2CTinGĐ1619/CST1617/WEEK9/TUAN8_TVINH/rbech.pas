USES MATH;
CONST FI='RBECH.INP';
      FO='RBECH.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V: LONGINT; LINK: LIST; End;
VAR A: ARRAY [0..2000005] OF LONGINT;
    XET: ARRAY [0..2000005] OF BOOLEAN;
    S1,S2: ARRAY [0..2000005] OF LIST;
    F:TEXT;
    N,ANS: LONGINT;


Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 for i:=0 to n-1 do read(f,a[i]);
 Close(F);
 End;

Procedure BFS;
 Var Front,Rear,u,v,sl:Longint;
     Tmp: List;
     Q: Array [0..100005] of Longint;
 Begin
 Fillchar(Xet,sizeof(xet),True);
 Front:=1; Rear:=1; Q[1]:=0; Ans:=0; sl:=1;
 Repeat
  U:=Q[Front]; Inc(front); If Front>100000 then Front:=1; Dec(Sl); Xet[u]:=False;
  If u+A[u]<N Then Begin
  Tmp:=S1[u+A[u]];
  While tmp<>Nil do
   Begin
   V:=Tmp^.V;
   Ans:=Max(Ans,v);
   If Xet[v] then Begin
   Inc(rear); If Rear>100000 then Rear:=1; Inc(sl); Q[Rear]:=v;
   End;
   Tmp:=tmp^.link;
   End;
  End;
  If U-A[u]>=0 then Begin
  Tmp:=S2[U-A[u]];
  While Tmp<>Nil do
   Begin
   V:=Tmp^.v;
   Ans:=Max(Ans,V);
   If Xet[v] then Begin
   Inc(rear); If rear>100000 then Rear:=1; Inc(sl); Q[Rear]:=V; End;
   Tmp:=Tmp^.link;
   End;
  End;
 Until sl<=0;
 End;

Procedure Try;
 Var tmp: List;
     i: Longint;
 Begin
 For i:=0 to n do Begin S1[i]:=Nil; S2[i]:=Nil; End;
 For i:=0 to n-1 do begin
  If i-a[i]>=0 then
  Begin
  New(tmp);
  Tmp^.v:=i; Tmp^.link:=S1[i-a[i]]; S1[i-a[i]]:=Tmp;
  End;
  If i+a[i]<=N Then
  Begin
  New(tmp);
  Tmp^.v:=i; Tmp^.link:=S2[i+a[i]]; S2[i+A[i]]:=Tmp;
  end;
  End;
 BFS;
 Assign(f,fo); Rewrite(F);
 Writeln(f,ans+1);
 Close(F);
 End;




Begin
 Init;
 Try;
End.
