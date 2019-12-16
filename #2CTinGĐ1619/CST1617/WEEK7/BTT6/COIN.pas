CONST FI='COIN.INP';
      FO='COIN.OUT';

VAR N,M,K,X,Y,L,T,Z,Loai: LONGINT;
    S,S1: STRING;
    A,V,R,Nhom: Array [0..30000] of Longint;
    CX: Array [0..30000] OF Boolean;
    Ke: Array [0..1000,0..1000] of BOOLEAN;
    F:TEXT;
    C: CHAR;

Procedure TachS;
 Var i,T: Longint;
 Begin
 T:=Length(S);
 I:=1;
 Repeat
 S1:=S1+S[i]; Inc(i);
 Until (Ord(S[I])>=60) And (Ord(S[i])<=62);
 VAL(s1,x,l);
 C:=S[i]; S1:='';
 For i:=i+1 to T do S1:=S1+S[i];
 VAL(s1,y,l);
 S:='';
 S1:='';
 End;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,Loai,k,m);
 n:=k;
 For m:=1 to m do
  Begin
  Readln(F,S);
  TACHS;
  Case C of
  '=' : Begin
        If (A[x]<>0) Then A[Y]:=A[x] else
         If (A[x]<>0) Then A[x]:=A[Y] else
          Begin Inc(T); A[x]:=T; A[y]:=T; end
        End;
  '>' : Begin
        If A[x]=0 Then Begin Inc(T); A[X]:=T; End;
        If A[y]=0 Then Begin Inc(T); A[Y]:=T; End;
        Ke[A[y],A[x]]:=True;
        End;
  '<' : Begin
        If A[x]=0 Then Begin Inc(T); A[X]:=T; End;
        If A[y]=0 Then Begin Inc(T); A[Y]:=T; End;
        Ke[A[x],A[y]]:=True;
        End;
  End;
  End;
 Close(F);
 End;


Procedure dfs_v(y,z: Longint);
 Var x: Longint;
 Begin
 For x:=1 To n Do
  If (cx[x]) and ke[x,y] Then
   Begin
   inc(v[z]); cx[x]:=false;
   dfs_v(x,z);
   End;
 End;

Procedure dfs_r(z,y: Longint);
 Var x: Longint;
 Begin
 For x:=1 To n Do
  If (cx[x]) and ke[y,x] Then
  Begin
  inc(r[z]); cx[x]:=false;
  dfs_r(z,x);
End;
End;

PROCEdure TRY;
Begin
 Init;
 N:=T;
 fillchar(v,sizeof(v),0);
 r:=v;
 For z:=1 To n Do
  Begin
  fillchar(cx,sizeof(cx),true);
  dfs_v(z,z);
  fillchar(cx,sizeof(cx),true);
  dfs_r(z,z);
  End;
 Assign(F,fO); Rewrite(F);
 For z:=1 To n Do
  If v[z]+r[z]=n-1 Then
  { If V[z]+1<=Loai Then }Nhom[z]:=V[z]+1;
 For z:=1 to k do
  IF Nhom[A[z]]=0 then writeln(f,'?') else Writeln(f,'C',Nhom[A[z]]);
 Close(F);
End;

Begin
 Init;
 Try;
End.


