const max = 10000;
var A: array [0..max] of longint;
    kt: array [0..max] of boolean;
    n,m,s,d: longint;

procedure print(k: longint);
  var j: longint;
  begin
    for j:= 1 to k do
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
          if (A[1]=s) and (A[i]=d) and (i<=m) then
            begin
              print(i);
            end
          else
            if A[1]=s then
              begin
                kt[j]:=true;
                try(i+1);
                kt[j]:=false;
              end;
        end;
  end;

BEGIN
  writeln('Bai 11');
  write('n: '); readln(n);
  write('m: '); readln(m);
  write('s: '); readln(s);
  write('d: '); readln(d);

  try(1);

  readln
END.