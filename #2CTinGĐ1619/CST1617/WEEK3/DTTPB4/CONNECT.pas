CONST FI='CONNECT.INP';
      FO='CONNECT.OUT';
      vocuc=1000000;
VAR a: array [0..1001,0..1001] of longint;
    t: array [0..1001] of record x,y: longint; end;
    q: array [0..1001] of boolean;
    d: array [0..1001] of longint;
    n,i,j: longint;
    f: text;

Procedure Init;
 Begin
 Assign(f,fI); reset(F);
 Readln(F,n);
 For i:=1 to n do readln(f,t[i].x,t[i].y);
 For i:=1 to n-1 do
  For j:=i+1 to n do
   if i<>j then begin a[i,j]:=abs(t[i].x-t[j].x) +abs(t[i].y-t[j].y);
                      a[j,i]:=a[i,j]; end
   else a[i,i]:=vocuc;
 Close(F);
 End;

Function Prim:longint;
 Var l,min: longint;
 Begin
 prim:=0;
 For l:=2 to n do begin
 min:=maxlongint;
 For i:=2 to n do
  if q[i] and (d[i]<min) then
   begin
    j:=i; min:=d[i];
    end;
 q[j]:=false;
 For i:=2 to n do
  if q[i] and (d[i]>a[i,j]) then d[i]:=a[i,j];
 prim:=prim+d[j];
  end;
 end;

Procedure Try;
 Var ans: longint;
 Begin
 d[1]:=0;
 For n:=2 to n do
  begin
  d[n]:=a[1,n]; q[n]:=true;
  end;
 ans:=prim;
 Assign(f,Fo); rewrite(F);Writeln(f,ans); close(F);
 End;


Begin
 Init;
 Try;
End.
