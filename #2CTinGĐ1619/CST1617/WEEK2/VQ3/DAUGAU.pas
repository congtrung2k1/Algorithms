USES MATH;
CONST FI='DAUGAU.INP';
      FO='DAUGAU.OUT';
TYPE list=record
     x1,y1,x2,y2,l: longint; end;
VAR XMIN,XMAX,YMIN,YMAX,X,Y,N,I,J,TMP: LONGINT;
    b: array [1..500] of longint;
    a: array [1..500] of list;
    t1: list;
    f: text;


Procedure Init;
 begin
 Assign(f,FI); Reset(F);
 Readln(f,x,y);
 Readln(f,n);
 For n:=1 to n do with a[n] do begin
  readln(f,x1,y1,x2,y2);
  if x1=x2 then begin b[n]:=x1; l:=1 end else begin l:=2; b[n]:=min(x1,x2); end
  end;
 Close(F);
 End;


Procedure kt(x:longint);
 Begin
 if (a[x].l=1) then
    IF (a[x].x1>=xmin) and (a[x].x1<=xmax) then
     begin
     ymin:=min(ymin,min(a[x].y1,a[x].y2));
     ymax:=max(ymax,max(a[x].y1,a[x].y2));
     End;
  IF (a[x].l=2) then
    if (a[x].y1>=ymin) and (a[x].y1<=ymax) then
     begin
     xmin:=min(xmin,min(a[x].x1,a[x].x2));
     xmax:=max(xmax,max(a[x].x1,a[x].x2));
     End;
 End;

Function Check(d: longint):boolean;
 Begin
 XMAX:=D; XMIN:=-D; YMIN:=-D; YMAX:=D;
 For i:=1 to n do begin
  kt(i);
  For j:=1 to n do begin
  kt(j);
  If (x>=xmin) and (x<=xmax) and (y>=ymin) and (y<=ymax) then exit(True);
  End;
  end;
  Exit(false);
  End;

Procedure Sort;
 Begin
 For i:=1 to n do
  For j:=i+1 to n-1 do
   If b[i]>b[j] then
    begin
    tmp:=b[i]; b[i]:=b[j]; b[j]:=tmp;
    t1:=a[i]; a[i]:=a[j]; a[j]:=t1;
    end;
 End;

Procedure Try;
 Var l,r,m,kq,d: longint;
     dk: boolean;
 Begin
 l:=0; r:=abs(max(x,y));
 kq:=maxlongint;
 sort;
 Repeat
 D:=(l+r) div 2;
 dk:=Check(D);
 if dk then Begin kq:=min(D,kq); r:=D-1 End else l:=D+1;
 Until l>r;
 Assign(F,FO); Rewrite(F);
 Writeln(f,kq);
 Close(F);
 End;


Begin
 Init;
 Try;
End.





