CONST FI='FACTORI.INP';
      FO='FACTORI.OUT';

VAR A,T: ARRAY [1..501] of longint;
    P: ARRAY [1..501] OF BOOLEAN;
    C: ARRAY [1..501,1..501] of longint;
    M,I,J,K,X: LONGINT;
    F,G: TEXT;

PRocedure Sang(m: longint);
 Begin
 For i:=1 to m do P[i]:=false;
 i:=2;
 While i<=m do
  begin
   if not p[i] then
     for j:=1 to m div i do
      if not p[i*j] then p[i*j]:=true;
  inc(i);
  End;
 End;

Procedure khoitao(x: longint);
 Var tmp: longint;
 Begin
 tmp:=x;
 For i:=1 to x do
  if p[i] then
   while tmp mod i=0 do begin
    inc(c[x,i]);
    tmp:=tmp div i;
    End;
 End;

Procedure Try;
 Begin
 Fillchar(c,sizeof(C),0);
 Fillchar(t,sizeof(t),0);
 For i:=1 to m do khoitao(i);
 For i:=2 to m do
  For j:=1 to m do
   c[i,j]:=c[i-1,j]+c[i,j];
 For j:=1 to m do
  For i:=1 to m do
   t[i]:=t[i]+C[j,i];
 a:=t;
 For i:=1 to m do
  begin
  a:=t;
   For j:=1 to m+1 do begin a[j]:=a[j]-C[i,j]; if odd(a[j]) then break; end;
  If j=m+1 then begin writeln(G,1,' ',i); exit; end;
  End;
 For i:=1 to m-1 do
  For j:=i+1 to m do Begin
   a:=t;
   For k:=1 to m+1 do begin a[k]:=a[k]-c[i,k]-c[j,k];
                            if odd(a[k]) then break; end;
   IF k=m+1 then begin writeln(g,2,' ',i,' ',j); exit; end;
  end;
 For i:=1 to m-2 do
  For j:=i+1 to m-1 do
   For k:=j+1 to m do
   Begin
   a:=t;
   For x:=1 to m+1 do begin a[x]:=a[x]-c[i,x]-c[j,x]-c[k,x];
                            if odd(a[x]) then break; end;
   IF x=m+1 then begin writeln(g,3,' ',i,' ',j,' ',K); exit; end;
   END;
 End;

PROCEDURE Init;
 Begin
 Assign(f,FI); Reset(F);
 Assign(G,FO); Rewrite(G);
 sang(500);
 While not eof(F) do
  begin
  readln(F,m);
  Try;
  End;
 Close(F);
 Close(G);
 End;

Procedure test;
 Begin
 Assign(F,FI); Rewrite(F);
 For i:=400 to 500 do writeln(f,i);
 Close(f);
 End;

Begin
 //test;
 Init;
End.
