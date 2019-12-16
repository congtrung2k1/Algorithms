program bai2_1_2;      {bai 2 de 1 trang 2}
type mang=array [1..100] of integer;
var fi,fo: text;
    m,n,i,d: longint;
    A:mang;
    procedure tt(m:longint; pt:byte);
      var c: string;
          d,i,t: byte;
      begin
       str(m,c);
       if c[1]<c[2] then t:=1 else t:=2;
       d:=1; i:=0;
       while i<length(c)-1 do
         begin
           inc(i);
           if (c[i]<c[i+1]) and (t=1) then
             begin
              inc(d);
              t:=2;
             end else if (c[i]>c[i+1]) and (t=2) then
                        begin
                         inc(d);
                         t:=1;
                        end;
         end;
       A[pt]:=d;
       writeln (fo,d);
      end;

    function kt( so:byte): boolean;
      var j:byte;
      begin
       if so<2 then kt:=false else
         if so>1 then
           begin
            j:=2;
            while so mod j<>0 do inc(j);
            if j=so then kt:=true else kt:=false;
           end;
      end;

begin
assign (fi,'lp.inp'); reset(fi);
assign (fo,'lp.out'); rewrite (fo);

read (fi,n);
for i:=1 to n do
 begin
  read (fi,m);
  if m>10 then tt(m,i) else writeln (fo,'1');
 end;

for i:=1 to n do
  begin
   if kt(A[i])=true then inc(d);
  end;
writeln(fo,d);

close(fi); close(fo);
end.
