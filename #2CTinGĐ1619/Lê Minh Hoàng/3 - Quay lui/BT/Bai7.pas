const max = 10000;
var n: longint;
    A: array [0..max] of longint;
    k: array [0..max] of boolean;

procedure print();
  var j: longint;
  begin
    for j:= 1 to n do
      if A[j]=j then exit;
    for j:=1 to n do write (A[j],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=1 to  n do
      if k[j] = false then
        begin
          A[i]:=j;
          k[j]:=true;
          if i = n then print
          else try(i+1);
          k[j]:= false
        end;
  end;

BEGIN
  writeln ('Bai 7');
  write ('n: '); readln(n);

  try(1);


  readln
END.






































