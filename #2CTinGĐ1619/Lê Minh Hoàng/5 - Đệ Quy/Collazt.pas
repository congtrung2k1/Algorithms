var n: longint;

function Collazt(n: longint): longint;
  begin
    if n = 1 then write('1')
    else
      if n mod 2 =0 then
        begin
          Collazt(n div 2);
          write (' * 2 ');
        end
      else
        begin
          Collazt(n*3+1);
          write(' div 3 ');
        end;
  end;

BEGIN
  write('Nhap n: '); readln(n);
  Collazt(n);

  readln
END.