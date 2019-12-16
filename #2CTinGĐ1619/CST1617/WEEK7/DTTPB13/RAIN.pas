//Cao Nguyet Minh - AC - Sai + Sai = Dung.
Const fi='RAIN.inp';
      fo='RAIN.out';
Type list=record x1,y1,x2,y2:longint; end;

Var t:array [0..1001] of list;
    ty: array [0..1001] of longint;
    x,n,i,j:longint;
    f:text;

Procedure Init;
 Begin
 Assign(f,FI);reset(f);
 Readln(f,x,n);
 For i:=1 to n do
  with t[i] do
  begin readln(F,x1,y1,x2,y2);
        if y1>y2 then ty[i]:=y1 else ty[i]:=y2;end;
 Close(F);
 End;



procedure sort(l,r: longint);
 var i,j,x,y: longint;
     tmp:list;
 begin
 i:=l; j:=r; x:=ty[(l+r) div 2];
 repeat
  while ty[i]<x do inc(i);
  while x<ty[j] do dec(j);
  if not(i>j) then begin
   tmp:=t[i]; t[i]:=t[j]; t[j]:=tmp;
   y:=ty[i]; ty[i]:=ty[j]; ty[j]:=y;
   inc(i); dec(J);
  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

Procedure Try;
 Begin
 Assign(F,Fo); rewrite(F);
 sort(1,n);
 i:=n;
 Repeat
 IF (x>=t[i].x1) and (x<=t[i].x2) then
  if t[i].y1>t[i].y2 then x:=t[i].x2 else x:=t[i].x1;
 Dec(i);
 Until i=0;
 Writeln(f,x);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
