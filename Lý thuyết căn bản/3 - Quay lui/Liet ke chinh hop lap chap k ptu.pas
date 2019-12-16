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
    for j:=1 to n do		// duyet gtri
      begin
        A[i]:=j;			//xac nhan gtri
        if i=k then print else try(i+1);
      end;
  end;

BEGIN
  write ('Nhap n: '); readln(n);
  write ('Nhap k: '); readln(k);

  try(1);

  readln
END.
