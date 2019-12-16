//CAO NGUYET MINH

uses math;
Const FI='rect.inp';
      Fo='rect.out';

Var a,queue: array [0..10001] of record x1,y1,x2,y2,m :longint; end;
    area: array [0..3000] of longint;
    n,x,y,i,j,c: longint;
    xet: array [1..4] of boolean;
    f: text;

Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(f,x,y,n);
 a[0].x2:=x; a[0].y2:=y; a[0].m:=1;
 For i:=1 to n do with a[i] do readln(f,x1,y1,x2,y2,m);
 Close(F);
 End;

Procedure Try;
 Var front,rear: longint;
 Begin
  front:=1; rear:=0;
  queue[0]:=a[0];
  for i:=1 to n do begin
   c:=front;
   while (rear<>c) do
    begin
     if (a[i].x2<=queue[rear].x1) or (a[i].x1>queue[rear].x2) or
      (a[i].y2<queue[rear].y1) or (a[i].y1>queue[rear].y2) then begin
       queue[front]:=queue[rear];
       inc(front); inc(rear);
       If (front>10000) then front:=0;
       If (rear>10000) then rear:=0;
       continue; end;
     If (a[i].x1<=queue[rear].x1) and (a[i].x2>=queue[rear].x2) and
      (a[i].y1<=queue[rear].y1) and (a[i].y2>=queue[rear].y2) then
       begin
        inc(rear);
        if (rear>10000) then rear:=0;
        continue;
       end;
     If (a[i].x1>queue[rear].x1) then
      begin
      queue[front]:=queue[rear];
      queue[front].x2:=a[i].x1;
      inc(front);
      if front>10000 then front:=0;
      queue[rear].x1:=a[i].x1;
      end;
     If (a[i].x2<queue[rear].x2) then
      begin
      queue[front]:=queue[rear];
      queue[front].x1:=a[i].x2;
      inc(front);
      if front>10000 then front:=0;
      queue[rear].x2:=a[i].x2;
      end;
    If (a[i].y1>queue[rear].y1) then
      begin
      queue[front]:=queue[rear];
      queue[front].y2:=a[i].y1;
      inc(front);
      if front>10000 then front:=0;
      queue[rear].y1:=a[i].y1;
      end;
     If (a[i].y2<queue[rear].y2) then
      begin
      queue[front]:=queue[rear];
      queue[front].y1:=a[i].y2;
      inc(front);
      if front>10000 then front:=0;
      queue[rear].y2:=a[i].y2;
      end;
     inc(rear);
     If (rear>10000) then rear:=0;
     end;
    queue[front]:=a[i];
    inc(front);
    If (front>10000) then front:=0;
   end;
  For i:=1 to 2500 do area[i]:=0;
  while rear<>front  do
   begin
    area[queue[rear].m]:=area[queue[rear].m]+
     (queue[rear].x2-queue[rear].x1)*(queue[rear].y2-queue[rear].y1);
    inc(rear);
    If (rear>10000) then rear:=0;
   End;
 Assign(f,FO); rewrite(F);
 For i:=1 to 2500 do
  if area[i]>0 then
   writeln(f,i,' ',area[i]);
 closE(F);
 End;


Begin
 Init;
 Try;
End.
