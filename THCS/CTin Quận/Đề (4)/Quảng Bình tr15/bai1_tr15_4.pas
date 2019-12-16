program bai1_tr13_4;
var fi,fo: text;
    A,B: array [1..100000] of longint;
    c,d,i,m,n: longint;

    function kt(vao:longint): boolean;
      var    i: longint;
      begin
        if vao=1 then kt:=false else
           for i:= 2 to trunc(sqrt(vao)) do
             if vao mod i=0 then exit(false) else kt:=true;
      end;


BEGIN
assign (fi,'input.inp'); reset(fi);
assign (fo,'output.out'); rewrite(fo);
read (fi,m,n);

c:=0;
d:=0;
for i:=1 to m do
  if m mod i=0 then
    if kt(i)=true then
      begin
       inc(c);
       A[c]:=i;
      end;
for i:=1 to n do
  if n mod i=0 then
    if kt(i)=true then
      begin
       inc(c);
       B[d]:=i;
      end;

if c=d then writeln (fo,'khong phai') else
  for i:=1 to c do
    if A[i]=B[i] then
      begin
       rewrite(fo); writeln (fo,'dung');
      end else begin
                 rewrite(fo); writeln (fo,'khong phai');
               end;

close(fi); close(fo);
END.