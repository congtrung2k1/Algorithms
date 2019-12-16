program bai4_tr2_1_2013_2014;
uses crt;
var fi,fo: text;
    m,n,h,c,max,cd: longint;
    A: array [1..100,1..100] of longint;
    gt: boolean;

    function nt(a:longint):boolean;
      var j: longint;
      begin
       if a>1 then
         begin
          j:=2;
          while a mod j<> 0 do inc(j);
          if j=a then nt:=true else nt:=false;
         end else nt:=false;
      end;

    function s(h,c,hh,cc,d:longint): longint;
      var hang,cot: longint;
      begin
       for hang:= h to hh do
        for cot:= c to cc do
          begin
           gt:=nt(A[hang,cot]);
           if gt=false then
             begin
              s:=0;
              exit;
             end else s:=sqr(d+1);
          end;
      end;

    function sm(h,c:longint): longint;
      var tang: longint;
      begin
       if (m-h) > (n-c) then cd:=n-c else cd:=m-h;
       for tang:=0 to cd do
         begin
          sm:=s(h,c,h+tang,c+tang,tang);
          if sm>max then max:=sm;
          if gt=false then exit;
         end;
      end;

 BEGIN
assign (fi,'DIENTICH.INP'); reset(fi);
assign (fo,'DIENTICH.OUT'); rewrite(fo);
read(fi,m,n);

gt:=true; max:=0;
while not eof(fi) do
 for h:=1 to m do
  for c:=1 to n do
   read(fi,A[h,c]);

for h:=1 to m do
 for c:=1 to n do
  if nt(A[h,c])=true then sm(h,c);

write(fo,max);
close(fi); close(fo);
END.
