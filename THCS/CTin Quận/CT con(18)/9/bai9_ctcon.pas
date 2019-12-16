program bai9_trang19;
uses crt;
type kieumang=array [1..100] of integer;
var fi,f2,f3: text;
    m,i: integer;
    t: boolean;
    c: kieumang;

    function ngto( var a:integer): boolean;
      var i: integer;
      begin
       ngto:=false;
       i:=2;
       while a mod i<> 0 do inc(i);
       if i=a then ngto:=true else ngto:=false;
      end;

    procedure hoan(var x,y:integer);
      var z:integer;
      begin
       z:=x; x:=y; y:=z;
      end;

    procedure sapxep(var c:kieumang; m:integer);
      var i,j:integer;
      begin
       for i:= 1 to m-1 do
        for j:= i+1 to m do
         if c[i]>c[j] then hoan(c[i],c[j]);
      end;

begin
assign (fi,'nt1.txt'); reset (fi);
assign (f2,'nt2.txt'); rewrite (f2);
assign (f3,'nt3.txt'); rewrite (f3);

m:=0;
while not(eof(fi)) do
  begin
   inc(m);
   readln(fi,c[m]);
   if ngto(c[m])=true then writeln(f2,c[m]);
  end;

sapxep(c,m);
for i:=1 to m do writeln(f3,c[i]);
close(fi); close(f2); close(f3);
end.