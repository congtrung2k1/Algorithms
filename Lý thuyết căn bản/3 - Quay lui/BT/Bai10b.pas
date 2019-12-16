const max = 10000;
var A: array [0..max] of longint;
    n,k: longint;

procedure print;
  var j: longint;
  begin
    for j:= 1 to k do
      write(A[j],#32);
    writeln
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:= A[i-1]+1 to n-k+i do
      begin
        A[i]:=j;
        if i = k then print else try(i+1);
      end;
  end;

BEGIN
  writeln('bai 5b');
  write('n: '); readln(n);
  write('k: '); readln(k);

  A[0]:=0;
  try(1);

  readln
END.