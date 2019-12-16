program bai2_tr23_4;
var fi,fo: text;
    chuoi:string;
    n,c,h,i,max,t,mh: longint;
    A: array [1..15,1..15] of char;

BEGIN
assign (fi,'input2.inp'); reset(fi);
assign (fo,'output2.out'); rewrite(fo);
read (fi,chuoi);
n:=trunc(sqrt(length(chuoi)));

c:=1; h:=1;
for i:=1 to length(chuoi) do
  begin
    if h<=n then
      begin
       A[h,c]:=chuoi[i];
       inc(h);
      end else begin
                inc(c);
                h:=1;
                A[h,c]:=chuoi[i];
                inc(h);
               end;
  end;

max:=0;
for h:=1 to n do
  begin
   t:=0;
   for c:=1 to n do inc(t,ord(A[h,c]));
   if t> max then
     begin
      max:=t;
      mh:=h;
     end;
  end;

for i:=1 to n do write (fo,A[mh,i],' '); writeln(fo);
writeln (fo,max);

close(fi); close(fo);
END.
