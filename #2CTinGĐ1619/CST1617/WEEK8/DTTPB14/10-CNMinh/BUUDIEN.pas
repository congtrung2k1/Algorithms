CONST FI='BUUDIEN.INP';
      FO='BUUDIEN.OUT';
      INF= TRUNC(10E5);
VAR A,TRACE: ARRAY [0..205,0..205] OF LONGINT;
    XET: ARRAY [0..205,0..205] OF BOOLEAN;
    N,M,U,V,C,I,J,K,ANS: LONGINT;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n,m);
 For u:=1 to n do
  For v:=1 to n do
   begin
   Trace[u,v]:=v;
   A[U,V]:=Inf;
   End;
 For m:=1 to m do begin
  Readln(f,u,v,c);
  A[u,v]:=C;
  A[v,u]:=C;
  End;
 Close(F);
 End;


Procedure Floyd;
 Begin
 For k:=1 to n do
  For u:=1 to n do
   For v:=1 to n do
    If A[u,v]>A[u,k]+A[k,v] then
     Begin
     A[u,v]:=A[u,k]+A[k,v];
     Trace[u,v]:=Trace[u,k];
     End;
 End;


Procedure Try;
 Var Tmp,Ma,S: Longint;
 Begin
 Floyd;
 for u:=1 to n do
  begin
  tmp:=0;
  for v:=1 to n do if u<>v then if a[u,v]<>Inf then
   if a[u,v]>tmp then tmp:=a[u,v];
  if tmp<ma then begin ma:=tmp; ans:=u; end;
  end;
 fillchar(xet,sizeof(xet),false);
 For u:=1 to n do
 if u<>ans then begin
  s:=ans;
  Repeat
  xet[s,trace[s,u]]:=true;
  s:=trace[s,u];
  until s=u;
  end;
 Assign(f,FO); rewrite(F);
 Writeln(f,ma);
 Writeln(f,ans);
 For u:=1 to n do
  For v:=1 to n do
   if xet[u,v] then writeln(f,u,' ',v);
 Close(F);
 end;


Begin
 Init;
 Try;
end.
