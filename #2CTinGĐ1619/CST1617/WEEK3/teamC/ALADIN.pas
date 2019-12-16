USES MATH;
CONST FI='ALADIN.INP';
      FO='ALADIN.OUT';
      inf=10000000;

VAR A: ARRAY [0..51,0..51] OF LONGINT;
    D: ARRAY [0..51,0..51] OF LONGINT;
    CKX,CKY,GMX,GMY: ARRAY [1..100] OF LONGINT;
    TD: ARRAY [1..4] OF LONGINT =(0,0,-1,1);
    TC: ARRAY [1..4] OF LONGINT =(-1,1,0,0);
    X,Y,N,M,Z,X1,Y1,t,t1,i,j,ans,kq: LONGINT;
    F: TEXT;

PROCEDURE INIT;
 Var tmp: char;
 BEGIN
 ASSIGN(F,FI); RESET(F);
 Readln(f,n,m,x,y,z);
 For i:=1 to n do begin
  For j:=1 to m do
   begin
   read(f,tmp);
   If tmp='A' then begin x1:=i; y1:=j; end;
   If tmp='M' then begin a[i,j]:=x;
                         inc(t); ckx[t]:=i; cky[t]:=j; end;
   If tmp='G' then begin INC(T1); GMx[T1]:=i; GMy[T1]:=j; end;
   IF tmp='V' then begin a[i,j]:=y; end;
   If tmp='#' then begin a[i,j]:=-1; end;
   end;
   readln(F);
  end;
 Close(F);
 End;

Function Check(x,y: longint): boolean;
 Begin
 Check:=(x>=1) and (x<=n) and (y>=1) and (y<=m);
 End;

Procedure BFS(x,y,c: longint);
 Var qx,qy: array [1..10000] of longint;
     free: array [1..50,1..50] of boolean;
     front,rear,ux,uy,vx,vy: longint;
 Begin
 ans:=maxlongint;
 For i:=1 to n do
  For j:=1 to m do
   d[i,j]:=inf;
 fillchar(free,sizeof(free),false);
 qx[1]:=x; qy[1]:=y; front:=1; rear:=1;
 free[x,y]:=true; d[x,y]:=0;
 Repeat
 ux:=qx[front]; uy:=qy[front]; inc(front);
 free[ux,uy]:=true;
 If c=4 then begin
  if (ux=n) or (ux=1) or (uy=m) or (uy=1) then ans:=min(ans,d[ux,uy]+z);
  end;
 For i:=1 to 4 do
  begin
  vx:=ux+td[i]; vy:=uy+tc[i];
  IF check(vx,vy) then
   if not free[vx,vy] then
    if a[vx,vy]<>-1 then
     IF D[VX,VY]>D[UX,UY]+A[vx,vy]+1 THEN
           begin
           d[vx,vy]:=d[ux,uy]+a[vx,vy]+1;
           inc(rear); qx[rear]:=vx; qy[rear]:=vy;
           end;
  End;
 Until front>rear;
 If c=1 then begin
  For i:=1 to t do if d[ckx[i],cky[i]]=inf then break;
  if (i=t) and (d[ckx[i],cky[i]]<>inf) then begin
   For i:=1 to t do
    if ans>d[ckx[i],cky[i]] then
     begin ans:=d[ckx[i],cky[i]];
           x1:=ckx[i]; y1:=cky[i];
           end;
   exit;
   end;
  end;
 If c=2 then
  If (d[ckx[1],cky[1]]<>inf) and (d[ckx[2],cky[2]]<>inf) then
   If d[ckx[1],cky[1]]>d[ckx[2],cky[2]] then
    begin ans:=d[ckx[1],cky[1]];
    x1:=ckx[1]; y1:=cky[1]; exit; end
     else begin
      ans:=d[ckx[2],cky[2]];
       x1:=ckx[2]; y1:=cky[2]; exit; end;
 IF c=3 then begin
  For i:=1 to t1 do
   if d[ckx[i],cky[i]]=inf then break;
  IF (i=t1) and (d[gmx[i],gmy[i]]<>inf) then begin
   For i:=1 to t1 do
    if ans>d[gmx[i],gmy[i]] then
     begin x1:=gmx[i]; y1:=gmy[i]; ans:=d[gmx[i],gmy[i]]; end;
   end;
 end;

 End;

Procedure Try;
 Begin
 Assign(F,FO); Rewrite(F);
 If t=2 then begin
  BFS(x1,y1,1);
  kq:=kq+ans;
  Writeln(kq);
  BFS(x1,y1,2);
  kq:=kq+ans;
  Writeln(kq);
  BFS(X1,Y1,3);
  kq:=kq+ans;
  BFS(X1,Y1,4);
  kq:=kq+ans;
  Writeln(f,kq);
  end;
 If t=1 then begin
  BFS(X1,Y1,1);
  KQ:=KQ+ANS;
  BFS(X1,Y1,3);
  KQ:=KQ+ANS;
  BFS(X1,Y1,4);
  KQ:=KQ+ANS;
  WRITELN(F,KQ);
  END;
 Close(F);
 End;


Begin
 Init;
 Try;
End.