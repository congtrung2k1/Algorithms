uses crt;
const max = 1000;
var A: array [1..max] of string;
    n,r,top,t: longint;
    s: string;

procedure push(s: string);
  begin
    inc(top);
    A[top]:=s;
  end;

function pop: string;
  begin
    pop:=A[top];
    dec(top);
  end;


BEGIN
  writeln('Bai 1');
  write('Nhap n (10): '); readln(n);
  write('Nhap he can chuyen: '); readln(r);

  top:=0;
  while n<>0 do
    begin
      if (n mod r) > 9 then
        case (n mod r) of
          10: s:='A';
          11: s:='B';
          12: s:='C';
          13: s:='D';
          14: s:='E';
          15: s:='F';
        end else str(n mod r,s);
      push(s);
      n:=n div r;
    end;
  while top<>0 do write(pop);

  readln
END.