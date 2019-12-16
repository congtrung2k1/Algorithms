uses crt;
const max = 1000;
var A: array [-5..max,-5..max] of boolean;
    cot,hang: array [0..max] of longint;
    n,i,j,dem: longint;
    h: array [1..8] of integer = (2,2, -2,-2, -1,-1, 1,1);    //xuong   len   trai   phai
    c: array [1..8] of integer = (1,-1, 1,-1, 2,-2, 2,-2);

procedure print(k:longint);
  var i: longint;
  begin
    for i:=1 to k do write (hang[i],',',cot[i],#32);
    writeln;
    readln;
    halt;
  end;

procedure try(i,j,d: longint);
  var k: longint;
  begin
    A[i,j]:=false; dec(dem);
    cot[d]:=j; hang[d]:=i;
    if dem = 0 then print(d);

    for k:=1 to 8 do
      begin
        i:=i+h[k];  j:=j+c[k];
        if A[i,j] then
          begin
            try(i,j,d+1);
            A[i,j]:=true; inc(dem);
          end;
        i:=i-h[k];  j:=j-c[k];
      end;
  end;

BEGIN
  clrscr;
  writeln ('Bai 9');
  write('n: '); readln(n);

  for i:=1 to n do
    for j:=1 to n do
      A[i,j]:=true;

  for i:=1 to n do
    for j:=1 to n do
      begin
        dem:=n*n;
        try(i,j,1);
        A[i,j]:=true;
      end;
END.
