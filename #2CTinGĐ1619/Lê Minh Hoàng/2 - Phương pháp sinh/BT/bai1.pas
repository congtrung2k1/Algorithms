const max = 100;
var
  x: array[1..100] of byte;
  n, i: byte;
begin
  writeln('Bai 1');
  write('Nhap n: '); readln(n);

  if n = 0 then exit;

  fillChar(x, SizeOf(x), 0);
  repeat
    for i := 1 to n do Write(x[i]);
    writeln;

    i := n;
    while (i > 0) and (x[i] = 1) do Dec(i);
    if i > 0 then
      begin
        x[i] := 1;
        fillChar(x[i + 1], (n - i) * SizeOf(x[1]), 0);
      end;
  until i = 0;
end.

