uses crt;
const max = 10000;
var x: array [0..max] of longint;
    A: array [0..max] of boolean;
    B: array [2..2*max] of boolean;
    C: array [1-max..max-1] of boolean;
    n: longint;

procedure print;
  var i,j: longint;
  begin
    clrscr;
//ve
    for i:=1 to n*2+1 do write('='); writeln;
    for i:=2 to n+1 do
      for j:=1 to n*2+1 do
        if (j mod 2 = 1) then
          begin
            gotoxy(j,i); write ('|');
            writeln;
          end;
    gotoxy(1,n+2);
    for i:=1 to n*2+1 do write('='); writeln;

    for i:=1 to n do
      begin
        gotoxy(x[i]*2,i+1);
        write('*');
      end;
    delay(2000);
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:= 1 to n do
      if (A[j]=false) and (B[i+j]=false) and (C[i-j]=false) then
        begin
          x[i]:=j;
          if i = n then
                        print
          else
                        begin
                          A[j]:=true; B[i+j]:=true; C[i-j]:=true;
                          try(i+1);
                          A[j]:=false; B[i+j]:=false; C[i-j]:=false;
                        end
        end;

  end;

BEGIN
  clrscr;
  writeln ('Bai 8');
  write ('n: '); readln (n);

  try(1);

END.





























