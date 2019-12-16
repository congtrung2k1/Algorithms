const max = 100;
var x,Best: array [1..max] of 'A'..'C';
    t: array [0..max] of longint;
    MinC,n: longint;

function same(i,l: longint): boolean;
  var j,k: longint;
  begin
    j:=i-l;
    for k:=0 to l-1 do
      if (x[i-k] <> x[j-k]) then exit(false);
    exit(true);
  end;

function check(i: longint): boolean;
  var l: longint;
  begin
    for l:=1 to i div 2 do
      if same(i,l) then exit(false);
    exit(true);
  end;

procedure KeepResult;
  begin
    MinC:=t[n];
    Best:=X;
  end;

procedure try(i: longint);
  var  j: 'A'..'C';
  begin
    for j:='A' to 'C' do
      begin
        x[i]:=j;
        if check(i) then
          begin
            if j='C' then t[i]:=t[i-1]+1 else t[i]:=t[i-1];
            if t[i] + (n-i) div 4 < MinC then
              if i=n then KeepResult
              else try(i+1);
          end;
      end;
  end;

procedure out;
  var i: longint;
  begin
    for i:=1 to n do write (best[i]);
    writeln;
    writeln('"C" count: ',MinC);
  end;

BEGIN
  write ('Nhap n: '); readln(n);

  MinC:=n;
  t[0]:=0;
  try(1);
  out;
  readln;
END.