var a,b: longint;

function uc(a,b: longint): longint;
  begin
    if b = 0 then uc:=a
    else uc := uc(b,a mod b);
  end;

BEGIN
  write('Nhap a: '); readln(a);
  write('Nhap b: '); readln(b);

  writeln(uc(a,b));

  readln
END.
