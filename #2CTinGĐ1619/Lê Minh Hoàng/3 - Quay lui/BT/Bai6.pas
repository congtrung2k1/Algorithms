const max = 10000;
var n,k,t,i: longint;
    A,x: array [0..max] of longint;

procedure print(k: longint);
  var j,max,min: longint;
  begin
    max:=0; min:=1000000000;
    for j:=1 to k do
      begin
        if x[A[j]]>max then max:=x[A[j]];
        if x[A[j]]<min then min:=x[A[j]];
      end;

    if max - min <= t then
      begin
        for j:=1 to k do write(x[A[j]],#32);
        writeln;
      end;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=A[i-1]+1 to n-k+i do
      begin
        A[i]:=j;
        if i = k then print(k) else try(i+1);
      end;
  end;

BEGIN
  writeln ('Bai 6');
  write ('n: '); readln(n);
  for i:=1 to n do
    begin
      write ('x[',i,'] = '); readln(x[i]);
    end;

  write ('t: '); readln(t);
  if (n=0) or (t=0) then exit;

  for k:= 1 to n do
    begin
      A[0]:=0;
      try(1);
    end;

  readln
END.
