var n: longint;

function Fibonacci(n: longint): longint;
  begin
    if n <= 2 then Fibonacci:=1
    else
      begin
        Fibonacci:= Fibonacci(n-1) + Fibonacci(n-2);
      end;
  end;

BEGIN
  write('Nhap n: '); readln(n);
  writeln(Fibonacci(n));

  readln
END.