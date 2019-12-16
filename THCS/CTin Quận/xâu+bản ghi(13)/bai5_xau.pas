program bai5_trang14;
uses crt;
var a: string;
begin
clrscr;
writeln ('nhap xau a'); readln (a); writeln;


while (pos('anh',a))<>0 do
  begin
    insert('em',a,pos('anh',a));
    delete(a,pos('anh',a),3);
  end;


writeln(a);
readln
end.
