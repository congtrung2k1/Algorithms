program bai4_trang19;
uses crt;
var fi,fo: text;
    a,b,c,n_cv,s: extended;
    kt: boolean;

    function kttg(a,b,c: extended): boolean;
      begin
       if (a+b>c) and (a+c>b) and (b+c>a) then kttg:=true else kttg:=false;
      end;

    procedure tg(a,b,c: extended);
      begin
        if (a=b) or (b=c) or (a=c) then
         begin
            if (a*a+b*b=c*c) or (a*a+c*c=b*b) or (b*b+c*c=a*a)
              then
                   begin
                     writeln(fo,'la tam giac vuong can');
                     exit;
                   end
              else if (a=b) and (a=c) then
                     begin
                      writeln(fo,'la tam giac deu');
                      exit;
                     end;
            writeln (fo,'la tam giac can');
            exit;
         end;
        if (a*a+b*b=c*c) or (a*a+c*c=b*b) or (b*b+c*c=a*a)
          then writeln(fo,'la tam giac vuong can');
      end;

begin
assign (fi,'input.inp'); reset(fi);
assign (fo,'output.out'); rewrite(fo);
read (fi,a,b,c);
kt:= kttg(a,b,c);
n_cv:= (a+b+c)/2;
s:= sqrt( n_cv* (n_cv*a)* (n_cv*b)* (n_cv*c) );
if kt=true then
 begin
   tg(a,b,c);
   writeln (fo,'chu vi: ',n_cv*2:1:2);
   writeln (fo,'dien tich: ',s:1:2);
 end;
close(fi); close(fo);
end.