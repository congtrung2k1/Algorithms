const max = 10000;
var A: array [0..max] of longint;
    n,k: longint;

procedure init;
  var i: longint;
  begin
    write ('n: '); read(n); writeln;
    write ('k: '); read(k); writeln;

    for i:=1 to 2*k do A[i]:=i;
    A[2*k+1]:=n;
    A[0]:=0;
  end;

procedure out;
  var i,j: longint;
  begin
    for i:=1 to (A[1]-1) div 2 do write('()');
    for i:=1 to 2*k do
      begin
        if i>k then  write(')') else write('(');
        for j:= 1 to (A[i+1] - A[i]) div 2 do write('()');
      end;
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    if i > 2*k then
                        begin out; exit end;
    if i = k+1 then
                        begin A[i]:=A[i-1]+1; try(i+1); exit; end;
    A[i]:=A[i-1]+1; try(i+1);

    for j:=1 to (n-2*k) div 2 do
      if (i<>k) and (A[i]+2*j <= A[i+1]) then
        begin
          inc(A[i],2*j);
          try(i+1);
        end;

    for j:=1 to (n-2*k) div 2 do
      if (i=k) and (A[i]+2*j <= A[i+2]) and (A[i+1]+2*j <= A[i+2]) then
        begin
          inc(A[i],2*j);
        end;
  end;


BEGIN
  init;
  try(1);
  readln
END.
