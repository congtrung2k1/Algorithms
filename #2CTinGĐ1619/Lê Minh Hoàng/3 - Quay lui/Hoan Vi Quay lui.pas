var n,i: longint;
    a: array [1..8] of longint;

procedure print;
  var i: longint;
  begin
    for i:=1 to n do write(a[i]);
    writeln
  end;

procedure doi(var i,j: longint);
  var t: longint;
  begin
    t:=i; i:=j; j:=t;
  end;

procedure try(n: longint);
  var j: longint;
  begin
    if n<=1 then print
    else
      begin
        for j:= 1 to n do
          begin
            doi(a[j],a[n]);
            try(n-1);
            doi(a[j],a[n]);
          end;
      end;
  end;

BEGIN
  write('Nhap n '); readln(n);
  for i:=1 to n do a[i]:=i;

  try(n);

  readln
END.
