USES MATH;
CONST FI='EXPEDIT.INP';
      FO='EXPEDIT.OUT';
TYPE LIST= RECORD
     X,Y,Z: LONGINT;
     END;
VAR N,M,K,L: LONGINT;
    P: ARRAY [0..25,0..25,0..25] OF LIST;
    U,v: List;
    F,G: TEXT;


Function SS(U,V: List): Boolean;
 Begin
 Exit((u.x=v.x) and (v.z=u.z) And (u.y=V.y));
 end;

Function Find(x: List): List;
 Begin
 If SS(P[x.x,x.y,x.z],x) then exit(X)
  else Exit(Find(P[x.x,x.y,x.z]));
 end;

Procedure Union(X,Y: list);
 Begin
 X:=Find(X); Y:=Find(Y);
 P[x.x,x.y,x.z]:=P[y.x,y.y,y.z];
 End;

Procedure OUtp(x,y:List);
 Begin
 Writeln(g,x.x,' ',x.y,' ',x.z,' ',y.x,' ',y.y,' ',y.z);
 End;
Procedure Try(St,En: List);
 Var u,v: List;
     Dis: Longint;
 Begin
 If st.x<>en.x then
  Begin
  If st.x>en.x then Dis:=-1 else Dis:=1;
  While not SS(st,en) Do
   Begin
   V:=St; V.x:=V.x+Dis;
   If SS(Find(St),Find(V)) then Outp(St,V) else Union(St,v);
   ST:=V;
   End;
  End;
 If st.y<>en.y then
  Begin
  If st.y>en.y then Dis:=-1 else Dis:=1;
  While not SS(st,en) Do
   Begin
   V:=St; V.y:=V.y+Dis;
   If SS(Find(St),Find(V)) then Outp(St,V) else Union(St,v);
   st:=v;
   End;
  End;
 If st.z<>en.z then
  Begin
  If st.z>en.z then Dis:=-1 else Dis:=1;
  While not SS(st,en) Do
   Begin
   V:=St; V.z:=V.z+Dis;
   If SS(Find(St),Find(V)) then Outp(St,V) else Union(St,v);
   ST:=V;
   End;
 End;
 End;


Procedure Init;
 Var i,j,k: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,n,m,k,l);
 For i:=1 to n do
  For j:=1 to m do
   For k:=1 to k do
    Begin P[i,j,k].x:=i; P[i,j,k].y:=j; P[i,j,k].z:=k; end;
 For L:=1 to l do
  Begin
  Readln(f,u.x,u.y,u.z,v.x,v.y,v.z);
  Try(U,v);
  End;
 Close(F); Close(G);
 End;


Begin
 Init;
End.
