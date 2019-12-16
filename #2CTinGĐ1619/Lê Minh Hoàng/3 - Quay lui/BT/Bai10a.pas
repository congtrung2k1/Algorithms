const max = 10000;
var A: array [0..max] of byte;
    n: byte;

procedure print;
  var j: byte;
  begin
    for j:= 1 to n do
      write(A[j],#32);
    writeln
  end;

procedure try(i: byte);
  var j: byte;
  begin
    for j:= 0 to 1 do
      begin
        A[i]:=j;
        if i = n then print else try(i+1);
      end;
  end;

BEGIN
  writeln('bai 5a');
  write('n: '); readln(n);

  try(1);

  readln
END.