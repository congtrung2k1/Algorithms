const max = 10000;
var A: array [0..max] of longint;
    kt: array [0..max] of boolean;
    n,k: longint;

procedure print;
  var j: longint;
  begin
    for j:= 1 to n do
      write(A[j],#32);
    writeln
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:= 1 to n do
      if kt[j]=false then
        begin
          A[i]:=j;
          if i = n then
                        print
          else
                        begin
                          kt[j]:=true;
                          try(i+1);
                          kt[j]:=false;
                        end;
        end;
  end;

BEGIN
  writeln('bai 5c');
  write('n: '); readln(n);
  write('k: '); readln(k);

  try(1);

  readln
END.