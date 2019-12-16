//CAO NGUYET MINH C02
CONST FI='TROCHOI.INP';
      FO='TROCHOI.OUT';

VAR A: array [0..301,0..301] of char;
    Free: array [0..301,0..301] of boolean;
    d: array [1..4] of longint=(0,0,-1,1);
    c: array [1..4] of longint=(-1,1,0,0);
    n,m,ans: longint;
    F: text;

PRocedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(F,n,m);
 For n:=1 to n do begin
  For m:=1 to m do read(f,a[n,m]);
  readln(F);
  End;
 Close(F);
 End;

Function Kt(X,Y:char; Z:longint):Boolean;
 Begin
 Case X of
 'A': begin
      IF (Y in ['A','B','F','G','H','I','J','L']) and (z=1)
       then exit(True);
      IF (Y in ['A','D','E','G','H','J','K','L']) and (z=2)
       then exit(true);
      IF (Y in ['A','B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true);
      end;
 'B': begin
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(True);
      IF (Y in ['A','B','E','F','H','I','J','L']) and (z=3)
       then exit(true);
      IF (Y in ['B','C','E','F','G','I','J','K']) and (z=4)
       then exit(true);
       end;
 'C': begin
      IF (Y in ['B','C','F','G','H','I','J','K']) and (z=1)
       then exit(True);
      IF (Y in ['C','D','F','G','H','L','I','J','K']) and (z=2)
       then exit(true);
      IF (Y in ['A','B','D','E','F','H','I','J','L']) and (z=3)
       then exit(true);
      end;
 'D': begin
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(True);
      IF (Y in ['A','D','E','F','H','J','K','L']) and (z=3)
       then exit(true);
      IF (Y in ['C','D','E','F','G','I','K','L']) and (z=4)
       then exit(true);
      end;
 'E': begin
      IF (Y in ['A','B','D','E','F','H','I','J','K','L']) and (z=3)
       then exit(True);
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(true);
      IF (Y in ['B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true);
      end;
 'F': begin
      IF (Y in ['A','B','D','E','F','H','I','J','K','L']) and (z=3)
       then exit(True) else exit(false);
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(true) else exit(false);
      IF (Y in ['B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true) else exit(false);
      end;
 'G': begin
      IF (Y in ['A','B','D','E','F','H','I','J','K','L']) and (z=3)
       then exit(True);
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(true);
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(true);
      end;
 'H': begin
      IF (Y in ['B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true);
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(true);
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(true);
      end;
 'I': begin
      IF (Y in ['B','C','F','G','H','I','J']) and (z=1)
       then exit(true);
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(true);
      IF (Y in ['A','B','D','E','F','H','I','J','K','L']) and (z=3)
       then exit(true);
      IF (Y in ['B','C','E','F','G','I','J','K']) and (z=4)
       then exit(true);
      end;
 'J': begin
      IF (Y in ['A','B','F','G','H','I','J','L']) and (z=1)
       then exit(True);
      IF (Y in ['A','C','D','E','G','H','I','J','K','L']) and (z=2)
       then exit(True);
      IF (Y in ['A','B','E','F','H','I','J','L']) and (z=3)
       then exit(true);
      IF (Y in ['A','B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true);
      end;
 'K': Begin
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(true);
      IF (Y in ['C','D','F','G','H','L','I','J','K']) and (z=2)
       then exit(true);
      IF (Y in ['A','B','D','E','F','H','I','J','K','L']) and (z=3)
       then exit(true);
      IF (Y in ['C','D','E','F','G','I','K','L']) and (z=4)
       then exit(true);
      End;
 'L': Begin
      IF (Y in ['A','B','C','F','G','H','I','J','K','L']) and (z=1)
       then exit(true);
      IF (Y in ['A','D','E','G','H','J','K','L']) and (z=2)
       then exit(true);
      IF (Y in ['A','D','E','F','H','J','K','L']) and (z=3)
       then exit(true);
      IF (Y in ['A','B','C','D','E','F','G','I','J','K','L']) and (z=4)
       then exit(true);
      End;
 End;
 Exit(false);
 End;


Function Check(x,y:longint): boolean;
 Begin
 Exit((x>=1) and (x<=n) and (y>=1) and (y<=m));
 End;

PRocedure BFS(x,y: longint);
 Var q,q1: array [1..100000] of longint;
     front,rear,u1,u2,v1,v2,i: longint;
 Begin
 front:=1; rear:=1;
 q[1]:=x; q1[1]:=y;
 Repeat
 u1:=q[front]; u2:=q1[front]; free[u1,u2]:=false;
 inc(front);
 For i:=1 to 4 do begin
  v1:=u1+d[i]; v2:=u2+c[i];
  If check(v1,v2) then
   if (free[v1,v2]) then
    if kt(a[u1,u2],a[v1,v2],i) then begin
     inc(rear); q[rear]:=v1; q1[rear]:=v2;
    end;
 end;
 Until front>rear;
 End;


Procedure Try;
 Var i,j,u,v: longint;
 Begin
 Fillchar(free,sizeof(free),true);
 For i:=1 to n do
  For j:=1 to m do
  if free[i,j] then begin inc(ans); bfs(i,j); end;
 Assign(F,FO); Rewrite(F); Writeln(f,ans); Close(F);
 End;

Begin
 Init;
 TRy;
End.
