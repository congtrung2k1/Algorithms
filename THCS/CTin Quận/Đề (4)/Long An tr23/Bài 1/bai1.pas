program bai1_tr23_4;
var fi,fo: text;
    n,i,j: longint;

    function kt(vao:longint): boolean;
      var i,d:longint;
      begin
       if vao=1 then exit(false) else
         begin
          d:=0;
          for i:=1 to vao do
            if vao mod i=0 then inc(d);
          if d=2 then kt:=true else exit(false);
         end;
      end;

    function tong(vao:longint): boolean;
      var i,t,so:longint;
          v:string;
      begin
        t:=0;
        str(vao,v);
        for i:=1 to length(v) do
          begin
           val(v[i],so);
           inc(t,so);
          end;
        if kt(t)=true then tong:=true else tong:=false;
      end;

BEGIN
assign (fi,'input1.inp'); reset(fi);
assign (fo,'output1.out'); rewrite(fo);
read (fi,n);

if kt(n)=true then
  if tong(n)=true then writeln (fo,'la so song to')
                  else writeln (fo,'n khong la so song to')
  else writeln (fo,'n khong la so song to');

for i:=1 to n do
  if kt(i)=true then
    if tong(i)=true then write (fo,i,' ');
writeln(fo);

i:=3;
if n<3 then writeln (fo,'(0;0)') else
 while i<n-1 do
   begin
    while (kt(i)=false) and (i<n-1) do inc(i,2);
    j:=i+2;
    if (kt(j)=true) and (j<=n) then write (fo,'(',i,',',j,'); ');
    i:=j;
   end;

close(fi); close(fo);
END.
