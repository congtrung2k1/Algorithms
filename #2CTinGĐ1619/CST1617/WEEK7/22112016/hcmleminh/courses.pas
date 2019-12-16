const
 fi = 'courses.inp'; fo = 'courses.out';

type
 kn = 1..100000;
 kmang = array[kn] of ansistring;
var
 a: kmang;
 n, tests: longint;
 stack: kmang; top: longint;
procedure Doc ();
var i: longint;
begin
 readln(n);
 for i:=1 to n do readln(a[i]);
end;


procedure SapXep (var a: kmang; const n: longint);
var x, y: ansistring;

 procedure SX (const l, r: longint);
 var i, j: longint;
 begin
  i:=l;j:=r;x:=a[(i+j)shr 1];
  repeat
   while a[i] < x do inc(i);
   while a[j] > x do dec(j);
   if not (i>j) then
    begin
     y:=a[i];a[i]:=a[j];a[j]:=y;
     inc(i);dec(j);
    end;
  until i>j;
  if l<j then sx(l,j);if i<r then sx(i,r);
 end;

begin
 SX(1, n);
end;


function Cung1Mon (const x, y: ansistring) : boolean; //x < y.
begin
 exit(pos(x, y) > 0);
end;


procedure XuLy ();
var i: longint;
begin
 SapXep (a, n);
 top := 0;
 for i:=1 to n do
  begin
   while (top > 0) and (Cung1Mon(stack[top], a[i])) do dec(top); //Pop.
   inc(top); stack[top] := a[i];
  end;
end;


procedure Xuat ();
begin
 writeln(top);
end;


begin
 assign(input, fi); reset(input); assign(output, fo); rewrite(output);
 readln(tests);
 for tests := 1 to tests do
  begin
   Doc ();
   XuLy ();
   Xuat ();
  end;
 close(input); close(output);
end.
