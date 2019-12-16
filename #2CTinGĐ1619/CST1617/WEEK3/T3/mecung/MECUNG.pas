CONST FI='MECUNG.INP';
      FO='MECUNG.OUT';
Type list=^node;
     node=record
     v: longint; link: list; end;

VAR N,M,K,T,ANS: LONGINT;
    B: ARRAY [1..100000] OF LIST;
    D: ARRAY [0..305,0..305] OF LONGINT;
    FREE: ARRAY [0..2000] OF BOOLEAN;
    QX,QY,DX,BAC: ARRAY [0..90000] OF LONGINT;
    A: ARRAY [0..301,0..301] OF CHAR;
    TD: ARRAY [1..4] OF LONGINT=(-1,1,0,0);
    TC: ARRAY [1..4] OF LONGINT=(0,0,-1,1);
    F: TEXT;


PROCEDURE INIT;
 BEGIN
 ASSIGN(F,FI); RESET(F);
 Readln(F,n,m,k);
 For n:=1 to n do begin
  For m:=1 to m do read(F,a[n,m]);
  readln(F);
  End;
 Close(F);
 End;


FUNCTION Check(X,y: longint): boolean;
 BEgin
 Exit((X>=1) and (x<=n) and (y>=1) and (y<=m));
 End;


Procedure BFS(x,y: longint);
 Var ch: char;
     ux,uy,vx,vy,front,rear,i,j: longint;
     tmp: list;
 Begin
 For i:=1 to 10000 do b[i]:=nil;
 qx[1]:=x; qy[1]:=y; ch:=a[x,y];
 front:=1; rear:=1; d[x,y]:=t; DX[T]:=1;
 Repeat
 ux:=qx[front]; uy:=qy[front]; inc(front);
 For i:=1 to 4 do
  begin
  vx:=ux+td[i];
  vy:=uy+tc[i];
  IF check(vx,vy) then
   if (d[vx,vy]=0) and (a[vx,vy]=ch) then
     begin d[vx,vy]:=t; INC(DX[T]);
           inc(rear); qx[rear]:=vx; qy[rear]:=vy; end
     else
   if (d[vx,vy]<>0) and (a[vx,vy]<>ch) then
    begin
    new(tmp); tmp:=B[t];
    While tmp<> nil do begin
                        if TMP^.v=D[vx,vy] then break;
                        tmp:=tmp^.link;
                        end;
    IF tmp=nil then begin
      new(tmp); tmp^.v:=D[vx,vy]; tmp^.link:=B[t]; B[t]:=tmp;
      new(tmp); tmp^.v:=t; tmp^.link:=B[d[vx,vy]]; B[d[vx,vy]]:=tmp;
      end;
    END;
  end;
 Until front>rear;
 End;

Procedure Try;
 Var i,j: longint;
     kt: boolean;
 Begin
 For i:=1 to n do
  For j:=1 to m do
   if d[i,j]=0 then begin inc(t); bfs(i,j); end;
 For i:=1 to t do
  For j:=1 to t do
   if b[i,j]=1 then inc(bac[i]);
 Fillchar(free,sizeof(free),true);
 Repeat
 kt:=true;
  For i:=1 to t do
   if (bac[i]<k) and (Free[i]) then begin kt:=false; break; end;
 IF kt then break else
  begin
  free[i]:=false;
  For j:=1 to t do if b[i,j]=1 then dec(bac[j]);
  end;
 Until False;
 For i:=1 to t do if free[i] then ans:=ans+dx[i];
 Assign(F,FO); Rewrite(F);
 Writeln(f,ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
