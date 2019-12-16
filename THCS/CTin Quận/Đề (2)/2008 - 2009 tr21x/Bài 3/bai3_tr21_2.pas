program bai3_tr21_2;
var fi,fo:text;
    x: string;  n,sso,min:longint;

    procedure hv(v:string; m:longint);
      var i,so:longint; t:char;
      begin
       if m=1 then exit else
         for i:=1 to m do
           begin
            t:=v[i]; v[i]:=v[m]; v[m]:=t;
            val(v,so);
            if (so<min) and (so>sso) then min:=so;
            hv(v,m-1);
           end;
      end;

BEGIN
assign (fi,'SNN.INP'); reset(fi);
assign (fo,'SNN.OUT'); rewrite(fo);
read(fi,x);

val(x,sso);
min:=10000000;
n:= length(x);
hv(x,n);
if min=10000000 then min:=0;
writeln (fo,min);

close(fi); close(fo);
END.