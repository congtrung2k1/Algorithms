program bai9_trang14;
uses crt;
var a: string;

begin
clrscr;
writeln ('nhap xau'); readln (a);

while A[1]=' ' do delete (a,1,1);
while A[length(a)]=' ' do delete (a,length(a),1);
while pos('  ',a)<>0 do delete(a,pos('  ',a),1);

writeln (a);
readln
end.