program bai1_tr3_2013_2014;
uses crt;
var  fi,fo: text;
     t,i,j: longint;
     c,n1:widestring;
     A: array [1..99] of longint;

     procedure doi();
       var x,vt,k: longint;
       begin
        k:=2;
        while length(c)>1 do
         if k=2 then
           begin
            k:=1;
            for x:=length(c) downto 1 do
             if x mod 2= 0 then delete(c,x,1);
           end
               else
           begin
            k:=2;
            for x:=length(c) downto 1 do
             if x mod 2 <>0 then delete(c,x,1);
           end;
       end;

BEGIN
assign (fi,'shorten.inp'); reset(fi);
assign (fo,'shorten.out'); rewrite(fo);
read(fi,t);

for i:=1 to t do read(fi,A[i]);
for i:=1 to t do
  begin
   c:='';
   for j:=1 to A[i] do begin
                        str(j,n1);
                        c:=c+n1;
                       end;
   doi;
   writeln(fo,c);
  end;

close(fi); close(fo);
END.