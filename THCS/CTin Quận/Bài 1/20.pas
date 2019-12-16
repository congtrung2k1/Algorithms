program bai20;
uses crt;
var i,d,k,a,b: longint;
begin
  repeat
writeln ('nhap a,b');  readln (a,b); writeln;
  until (a<b) and (a>1);
d:=0;
for  i:=a to b do
 if i>1 then
   begin
     k:=2;
     while i mod k<>0 do inc (k);
     if k=i then
      begin
       inc(d);
       writeln (i);
      end;
   end;
writeln ('co ',d,' so nguyen to');
readln
end.
