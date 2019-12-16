USES MATH;
CONST FI='WEATHER.INP';
      FO='WEATHER.OUT';
TYPE LIST=^NODE;
     NODE=RECORD
     V,C: LONGINT; LINK: LIST; END;
VAR A: ARRAY [0..105] OF LIST;
    FREE: ARRAY [0..105] OF BOOLEAN;
    NUM,LOW,CHILD: ARRAY [0..105] OF LONGINT;
    MARK: ARRAY [-5005..5005] OF BOOLEAN;
    STACK: ARRAY [0..5005] OF LONGINT;
    N,M,COUNT,RES,TOP: LONGINT;
    F: TEXT;

Procedure InStall(x,y,c: Longint);
 Var Tmp: List;
 Begin
 New(Tmp); Tmp^.v:=y; Tmp^.C:=C; Tmp^.link:=A[x]; A[x]:=Tmp;
 End;


Procedure Init;
 Var i,u,v: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(F,n);
 Readln(F,m);
 For i:=1 to m do
 Begin Readln(f,u,v);
       Install(u,v,i);
       Install(v,u,-i);
 end;
 Close(F);
 End;

Procedure Push(x: Longint);
 Begin
 Inc(Top);
 Stack[Top]:=X;
 End;

Function Pop: Longint;
 Begin
 Pop:=Stack[Top];
 Dec(Top);
 End;

Procedure Visit(U: Longint);
 Var Tmp: List;
     c,v: Longint;
 Begin
 Child[u]:=1; Inc(Count); Num[u]:=Count; Low[u]:=Count; Tmp:=A[u];
 While tmp<>nil do
  Begin
  C:=Tmp^.C;
  If Mark[C] Then
   Begin
   Mark[-c]:=False;
   V:=Tmp^.v;
   If Num[v]>0 Then Low[u]:=Min(Low[u],Num[v])
    Else Begin
     Visit(v);
     Inc(Child[u],Child[v]);
     If Low[v]>Num[u] Then Push(V);
     Low[u]:=Min(Low[u],Low[v]);
     End;
   End;
  Tmp:=Tmp^.link;
  End;
 End;


Procedure Try;
 Var u: Longint;
 Begin
 Fillchar(Mark,sizeof(Mark),True);
 Fillchar(Num,n,0);
 Count:=0; Top:=0; Res:=0;
 For u:=1 to n do
  If Num[u]=0 then Visit(u);
 While Top>0 do
  Begin
  U:=Pop;
  Inc(Res,Child[u]*(N-Child[u]));
  End;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Res);
 Close(F);
 End;


Begin
 Init;
 Try;
End.

