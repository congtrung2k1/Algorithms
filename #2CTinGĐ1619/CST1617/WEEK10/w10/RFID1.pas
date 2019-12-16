uses math;
const fi = 'RFID.INP';
      fo = 'RFID.OUT';
type kPoint = record x,y:Longint; end;
     kLine = record p1,p2:kPoint;  end;

var Test,S,P,W,R,Ans: Longint;
    CB,SP,A: Array [0..250000] of Kpoint;
    Tuong: Array [0..20] Of KLine;
    x1,x2,y1,y2:real;
    ss,se:kPoint;
    h1,h2,h3,h4:kPoint;
    F,G: Text;

function Point(a,b:Longint):kPoint;
begin
   Point.x := a;
   Point.y := b;
end;

function Line(p1,p2:kPoint):kLine;
begin
   Line.p1 := p1;
   Line.p2 := p2;
end;

function ccw(a,b,c:kPoint):integer;
var dx1,dx2,dy1,dy2,d:real;
begin
   dx1 := b.x-a.x; dy1 := b.y-a.y;
   dx2 := c.x-a.x; dy2 := c.y-a.y;
   d := dx1*dy2 - dy1*dx2;
   if d < 0 then exit(-1);
   if d > 0 then exit(1);
   if d = 0 then
   begin
      if (dx1*dx2 < 0) or (dy1*dy2 < 0) then exit(-1);
      if sqr(dx1)+sqr(dy1) >= sqr(dx2) + sqr(dy2) then exit(0) else exit(1);
   end;
end;

procedure sort(l,r: longint);
 var i,j,x: longint;
     Y: Kpoint;
 begin
 i:=l; j:=r;
 x:=(l+r) div 2;
 repeat
 while (CB[i].x<CB[x].x) Or ((CB[i].x=CB[X].x) And (CB[i].y<CB[x].y)) do inc(i);
 while (CB[x].x<CB[j].x) Or ((CB[j].x=CB[x].x) And (CB[x].y<CB[j].y)) do dec(j);
 if not(i>j) then begin y:=CB[i]; CB[i]:=CB[j]; CB[j]:=y;
                        inc(i); j:=j-1;
                  end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;

function intersect(l1,l2:kLine):boolean;
var A,B,C,D:kPoint;
begin
   A := l1.p1; B := l1.p2;
   C := l2.p1; D := l2.p2;
   if (ccw(A,B,C)*ccw(A,B,D) <= 0) and (ccw(C,D,A)*ccw(C,D,B) <= 0) then exit(true) else exit(false);
end;

Function DoDai(P1,P2: KPoint): Extended;
 Begin
 Exit(Sqrt(Sqr(P1.x-P2.x)+Sqr(P1.y-P2.y)));
 End;

Procedure Try;
 Var D,X: extended;
     L1: KLine;
     i,j,k: Longint;
 Begin
 Sort(1,S);
 For j:=1 to P do Begin
  Ans:=0;
  For i:=1 to S do Begin
   L1:=Line(CB[i],SP[j]);
   D:=Dodai(CB[i],Sp[j]); X:=0;
   If D>R Then continue;
   For k:=1 to W do
    If Intersect(L1,Tuong[k]) Then X:=X+1;
   If D+x<=R then Begin Inc(Ans); A[Ans]:=CB[i]; End;
   End;
  Write(G,Ans,' ');
  For Ans:=1 to Ans do Write(g,'(',A[Ans].x,',',A[Ans].y,') ');
  Writeln(G);
  End;
 End;

Procedure Init;
 Var Test: Longint;
     St,En: Kpoint;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(G);
 Readln(f,Test);
 for Test:=1 to Test do
  Begin
  Readln(f,S,R,W,P);
  For S:=1 to S do With CB[s] do Readln(f,X,Y);
  For W:=1 to W do Begin
   Readln(f,St.x,St.y,En.x,En.y);
   Tuong[w]:=Line(St,En);
   End;
  For P:=1 to P do With SP[P] do Readln(f,X,y);
  Try;
  End;
 Close(F); Close(G);
 end;

begin
 Init;
end.
