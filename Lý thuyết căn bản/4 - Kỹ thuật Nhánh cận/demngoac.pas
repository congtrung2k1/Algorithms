var x: array [1..100] of longint;
    n: longint;

function kiemtra: boolean;
  var d,i: longint;
  begin
    d:=0;
    for i:=1 to n do
      begin
        if x[i]=1 then inc(d) else dec(d);
        if d<0 then exit(false);
      end;
    if d=0 then exit(true) else exit(false);
  end;

procedure print;
  var i: longint;
  begin
    for i:=1 to n do
      if x[i]=1 then write('(') else write(')');
    writeln
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=0 to 1 do
      begin
        x[i]:=j;
        if i=n then
         begin
           if kiemtra then print;
         end
        else try(i+1);
      end;
  end;

BEGIN
  readln(n);
  n:=2*n;
  try(1);
  readln
END.
