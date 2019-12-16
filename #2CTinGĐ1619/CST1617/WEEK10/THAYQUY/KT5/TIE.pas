USES MAth;
CONST FI='TIE.INP';
      FO='TIE.OUT';
Type list = record
     x,y: Longint; end;
VAR N,M,X,Y,KQ: LONGINT;
    BX,BY: ARRAY [0..10005] OF LONGINT;
    AX,AY,NP: ARRAY [0..15] OF LONGINT;
    F: TEXT;


Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m,x,y);
 For i:=1 to n do Readln(f,ax[i],ay[i]);
 For i:=1 to m do Readln(f,bx[i],by[i]);
 Close(F);
 End;

Procedure KT(Var u,v: List);
 Var tmp: list;
 Begin
 If u.y<u.x then
  Begin
  tmp:=u; u:=v; v:=u;
  End;
 End;

Procedure Sol;
 Var U,V,U1,V1: List;
     i,j,t,tmp: Longint;
 Begin
 u.x:=x; U.y:=y;
 i:=2; j:=m;
 Repeat
 u1.x:=bx[i]; u1.y:=by[i];
 v1.x:=bx[j]; v1.y:=by[j]; tmp:=0;
 For t:=1 to n do
  If np[t]=1 then Begin
   Inc(tmp);
   KT(u1,v1);
   IF (u1.y>=ay[t]) And (v1.y<=Ay[t]) Then
    If (u1.x<=ax[t]) And (v1.x<=Ax[t]) then
     Exit;
   End;
 Inc(i); Dec(j);
 Until i>=j;
 If i>=j then IF tmp<>0 then KQ:=Min(tmp,KQ);
 End;

Procedure Nhiphan(x: Longint);
 Var i: Longint;
 Begin
 If x>N Then Sol else
  For i:=0 to 1 do Begin NP[x]:=i; Nhiphan(X+1); End;
 end;

Procedure Try;
 Begin
 Assign(f,fo); rewrite(F);
 Writeln(f,5);
 Close(F);
 End;

Procedure Try1;
 Begin
 KQ:=11;
 Nhiphan(1);
 Writeln(KQ);
 End;

Begin
 Init;
 Try1; //Try;
End.
