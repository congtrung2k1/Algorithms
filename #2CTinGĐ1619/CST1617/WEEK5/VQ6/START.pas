CONST FI='START.INP';
      FO='START.OUT';
TYPE LIST=RECORD
     X,Y: LONGINT;
     END;
VAR A: ARRAY [0..1000] OF LONGINT;
    D: ARRAY [0..1000] OF LIST;
    N: longint;
    F: TEXT;


PROCEdure INIT;
 Begin
 Assign(f,fI); REset(f);
 REadln(f,n);
 For n:=1 to n do
  with d[n] do
   begin
   readln(f,x,y);
   y:=y-x;
   end;
 Close(F);
 End;

procedure sort(l,r: longint);
 var x1,i,j,x: longint;
     y: list;
 begin
 i:=l; j:=r;
 x:=d[(l+r) div 2].x;
 x1:=d[(l+r) div 2].y;
 repeat
 while (d[i].y<x1) or ( (d[i].y=x1) and (d[i].x<x) ) do inc(i);
 while (x1<d[j].y) or ( (d[j].y=x1) and (d[j].x>x) ) do dec(j);
 if not(i>j) then
 begin
  y:=d[i]; d[i]:=d[j]; d[j]:=y;
  inc(i); Dec(j);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

procedure Try;
 Var tmp,i,j,min,max: longint;
begin
 Sort(1,n); max:=-maxlongint;
 for i:=1 to n do
 begin
  min:=maxlongint;
  for j:=d[i].x to d[i].x+d[i].y do
  if a[j]<min then
  begin
   min:=a[j];
   tmp:=j;
  end;
  a[tmp]:=a[tmp]+1;
  if a[tmp]>max then max:=a[tmp];
 end;
 Assign(f,FO); Rewrite(F);
 Writeln(f,max);
 Close(F);
end;



Begin
 Init;
 Try;
End.