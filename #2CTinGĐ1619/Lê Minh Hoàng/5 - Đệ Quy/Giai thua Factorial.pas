var n: longint;

function Factorial(n: longint): longint;
  begin
    if n = 0 then Factorial:=1
    else
      begin
        Factorial:=n * Factorial(n-1);
      end;
  end;

BEGIN
  write('Nhap n: '); readln(n);
  writeln(Factorial(n));

  readln
END.