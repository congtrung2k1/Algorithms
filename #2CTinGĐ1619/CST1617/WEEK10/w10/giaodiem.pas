uses math;
const
   fi = 'giaodiem.inp';
   fo = 'giaodiem.out';

type
   kPoint = record
      x,y:real;
   end;

   kLine = record
      p1,p2:kPoint;
   end;

var
   t:longint;
   x1,x2,y1,y2:real;
   ss,se:kPoint;
   h1,h2,h3,h4:kPoint;

function Point(a,b:real):kPoint;
begin
   POint.x := a;
   POint.y := b;
end;

function Line(p1,p2:kPoint):kLine;
begin
   Line.p1 := p1;
   Line.p2 := p2;
end;

function ccw(a,b,c:kPoint):integer;
var
   dx1,dx2,dy1,dy2,d:real;
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

function intersect(l1,l2:kLine):boolean;
var
   A,B,C,D:kPoint;
begin
   A := l1.p1; B := l1.p2;
   C := l2.p1; D := l2.p2;

   if (ccw(A,B,C)*ccw(A,B,D) <= 0) and (ccw(C,D,A)*ccw(C,D,B) <= 0) then exit(true) else exit(false);
end;

function xuli():char;
var
   ll,l:kLine;
begin
   ll := Line(ss,se);
   h1 := Point(min(x1,x2),max(y1,y2));
   h3 := Point(max(x1,x2),min(y1,y2));

   h2 := h1;
   h2.y := h3.y;

   h4 := h3;
   h4.y := h1.y;

   if (h1.x <= se.x) and (se.x <= h3.x) and (h3.y <= se.y) and (se.y <= h1.y) then exit('T');
   if (h1.x <= ss.x) and (ss.x <= h3.x) and (h3.y <= ss.y) and (ss.y <= h1.y) then exit('T');

   l := Line(h1,h2);
   if intersect(l,ll) then exit('T');

   l := Line(h2,h3);
   if intersect(l,ll) then exit('T');

   l := Line(h3,h4);
   if intersect(l,ll) then exit('T');

   l := Line(h4,h1);
   if intersect(l,ll) then exit('T');

   exit('F');
end;

procedure main();
begin
   read(t);
   for t := 1 to t do
   begin
      read(ss.x,ss.y,se.x,se.y,x1,y1,x2,y2);
      writeln(xuli());
   end;
end;

begin
   assign(input,fi);reset(input);
   assign(output,fo);rewrite(output);
   main();
end.
