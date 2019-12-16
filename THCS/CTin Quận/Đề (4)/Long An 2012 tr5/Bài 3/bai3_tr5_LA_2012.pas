program bai3_tr5_LA_2012;
label l1;
var fi,fo: text;
    d,c,m,n,i: longint;
    A: array [0..2000] of boolean;

BEGIN
assign (fi,'dulieu.inp'); reset (fi);
assign (fo,'Ketqua.out'); rewrite (fo);
read (fi,n);
for i:=1 to n do A[i]:=true;

d:=1; c:=1; m:=n;

while m>1 do
  begin                                    {********}
    l1:  while d=1 do
           begin
            inc(c);
            if c>n then                              {**}
              begin
               c:=0;
               goto l1;
              end;
            if (d=1) and (A[c]=true) then             {**}
              begin
               d:=0;
               A[c]:=false;
               dec(m);
              end;
           end;

         inc(c);
         if A[c]=true then
           begin
            d:=1;
            if m=2 then break;
           end;

         if c>n then c:=0;

  end;                                     {********}

writeln (fo,c);

close(fi); close(fo);
END.