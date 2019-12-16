Const FI='quanma.inp';
      FO='quanma.out';
Var b: array [-1..202,-1..202] of longint;
    td: array [1..4] of longint=(-2,-2,-1,1);
    tc: array [1..4] of longint=(1,-1,-2,-2);
    i,u,v,cheo,j,k,m,n,c,x,y: longint;
    f,g: text;

Function Check(e,f:longint):boolean;
 Begin
 exit((1<=e) and (e<=m) and (1<=f) and (f<=n));
 end;

Function kt(e,f:longint):boolean;
 Begin
 For k:=1 to 4 do
  begin
  u:=td[k]+e;
  v:=tc[k]+f;
  If b[u,v]=-1 then exit(true);
  end;
 Exit(false);
 End;

Procedure Try;
 Begin
 For i:=1 to m do
  for j:=1 to n do b[i,j]:=0;
 For i:=1 to 2 do
  For j:=1 to 2 do b[i,j]:=-1;
 u:=3;
 For cheo:=3 to m+n do
  begin
   for i:=1 to m do
    begin
    j:=cheo-i;
    if check(i,j) then if kt(i,j) then b[i,j]:=1 else b[i,j]:=-1;
    end;
  end;
 End;

Procedure Init;
 Begin
 Assign(F,FI); reset(F);
 Assign(g,FO); rewrite(G);
 Readln(f,m,n,c);
 try;
 For c:=1 to c do begin readln(F,x,y); writeln(g,b[x,y]); end;
 Close(F); Close(G);
 End;


Begin
 Init;
End.
