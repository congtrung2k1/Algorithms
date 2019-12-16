Uses Math;
CONST FI='VUONTRE.INP';
      FO='VUONTRE.OUT';
      Inf=1000000000;
VAR C: ARRAY ['A'..'z','A'..'z'] OF LONGINT;
    N,M,ANS: LONGINT;
    X: CHAR;
    F: TEXT;


Procedure Init;
 Var u,v: Char;
     t: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,m);
 For u:='A' to 'z' do
  For v:='A' to 'z' do C[u,v]:=inf;
 For m:=1 to m do
  begin
  Read(f,u);
  Read(f,v);
  While v=' ' do Read(f,v);
  Readln(f,t);
  C[u,v]:=Min(c[u,v],t); C[v,u]:=Min(C[u,v],t);
  End;
 Close(F);
 End;


Procedure Try;
 Var k,u,v: Char;
 Begin
 For k:='A' to 'z' do
  For u:='A' to 'z' do
   For v:='A' to 'z' do
    If C[u,v]>C[u,k]+C[k,v] then C[u,v]:=C[u,k]+C[k,v];
 U:='z';
 Ans:=Maxlongint;
 for V:='A' to 'Z' do
  If U<>V Then
   If Ans>C[u,v] then
    begin
    Ans:=C[u,v];
    X:=v;
    End;
 Assign(F,FO); Rewrite(F);
 Writeln(F,X,' ',Ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
