const max = 10000;
var n: longint;
    A: array [0..max] of longint;

procedure print;
  var i: longint;
  begin
    for i:=1 to n do write(A[i]);
     writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=0 to 1 do
      begin
        A[i]:=j;
        if i = n then print else try(i+1);
      end;
  end;


BEGIN
  write ('Nhap n: '); readln(n);

  try(1);

  readln
END.