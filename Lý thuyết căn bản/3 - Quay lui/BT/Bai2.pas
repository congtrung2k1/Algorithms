const max = 10000;
var n,k: longint;
    A: array [0..max] of longint;

procedure print;
  var i: integer;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=1 to n do
      begin
        A[i]:=j;
        if i=k then print else try(i+1);
      end;
  end;

BEGIN
  writeln ('Bai 2');
  write ('n '); readln(n);
  write ('k '); readln(k);

  try(1);

  readln
END.