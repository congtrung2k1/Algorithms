Const FI='colotria.inp';
      Fo='colotria.out';

Var c: array [1..1000,1..1000] of boolean;
    a: array [1..1000] of longint;
    kq,tmp: int64;
    f:text;
    u,v,m,n:longint;

Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(f,n,m);
 Fillchar(c,sizeof(c),false);
 For m:=1 to m do begin
  readln(f,u,v);
  c[u,v]:=true;
  c[v,u]:=true;
  end;
 Close(F);
 End;

Procedure Try;
 Begin
 kq:=(n*(n-1)*(n-2))div 6;
 tmp:=0;
 For u:=1 to n do begin
  For v:=1 to n do
  if c[u,v] and (u<>v) then inc(a[u]);
  tmp:=tmp+a[u]*(n-1-a[u]); end;
 Writeln(f,kq-(tmp div 2));

 End;

Begin
 Init;
 Assign(F,FO);rewrite(F);
 IF n<3 then writeln(f,0) else Try;
 Close(F);
End.
