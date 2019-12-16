var n: longint;

function move(n,x,y: longint): longint;
  begin
    if n=1 then begin writeln('Chuyen 1 dia tu ',x,' sang ',y); readln; end
    else
      begin
        move (n-1,x,6-x-y);                    // Chuyen n-1 dia tu x sang trung gian
        move (1,x,y);                          // Chuyen dia to nhat sang y
        move (n-1,6-x-y,y);                    // Chuyen dia tu trung gian sang y
      end;
  end;

BEGIN
  write('Nhap n: '); readln(n);
  move (n,1,2);

  readln
END.