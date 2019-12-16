program bai2_tr5_LA_2012;
var fi,fo: text;
    i:  longint;
    function t_u(a:longint):  longint;
      var ii: longint;
      begin
       t_u:=0;
       for ii:=1 to a-1 do
        if a mod ii = 0 then t_u:=t_u+ii;
      end;

BEGIN
assign (fo,'output.dat'); rewrite (fo);
for i:=100 to 1000 do

 if (i= t_u(t_u(i))) and (i <> t_u(i)) then

   if i< t_u(i) then writeln (fo,i,' ',t_u(i))
                else writeln (fo,t_u(i),' ',i);

close (fo);
END.
