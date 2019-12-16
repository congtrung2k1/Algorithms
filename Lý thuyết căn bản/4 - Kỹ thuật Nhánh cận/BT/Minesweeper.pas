const fi='MINE.INP';
      fo='MINE.OUT';
      maxn= 100;
var m,n : integer;
    f:text;
    board: array[0..maxn+1, 0..maxn+1] of byte;
    mine: array[-1..maxn+2, -1..maxn+2] of byte;
    moveh: array[1..7] of integer=(-1,-1,0,1,1,0,-1);
    movec: array[1..7] of integer=(0,-1,-1,-1,0,1,1);
procedure input;
  var i, j: integer;
  begin
    assign(f, fi); reset(f);
    readln(f, m ,n);

    for i:=1 to m do
      for j:=1 to n do read(f, board[i, j]);
    close(f);
  end;

procedure init;
  begin
    fillchar( board, sizeof(board), 4);
    fillchar( mine, sizeof(mine), 0);
  end;

procedure output;
  var i, j, count: integer;
  begin
    assign(f, fo); rewrite(f);

    count:= 0;
    for i:=1 to m do
      for j:=1 to n do count:= count + mine[i, j];
    writeln(f, count);

    for i:=1 to m do
      begin
        for j:=1 to n do write(f, mine[i, j], ' ');
        writeln(f);
      end;
    close(f);
    halt;
  end;

{kiem tra xem co bom o o i, j khi dang xet toi hang h va cot c}
function kiemtra(i, j: integer): byte;
  var k: integer;
      count: integer;
    begin
        i:= i-1;
        j:= j-1;
        count:= 0;
        for k:=1 to 7 do
        if mine[i+moveh[k], j+ movec[k]]=1 then
            begin
              count:= count+1;
            end;
        if count= board[i, j]-1 then
        kiemtra:= 0
        else if count= board[i, j] then
        kiemtra:= 1
        else kiemtra:= 2;
    end;

function suytiep(j: integer): boolean;
  var i: integer;
  begin
    for i:= 2 to m do {duyet qua tung hang}
      begin
        case kiemtra(i, j) of
          0: mine[i, j]:= 1;
          1: mine[i, j]:= 0;
          else exit(false);
        end;
      end;
    exit(true);
  end;

procedure tryngang(i: integer);
  var j: integer;
  begin
    if i> n then
         output
    else
         for j:= 0 to 1 do
           begin
             mine[1, i]:= j;
             if suytiep(i) then tryngang(i+1);          {kiem tra xem ket qua co bi sai khong}
           end;
  end;

procedure trydoc(i: byte);
  var j:byte;
  begin
    if i> m then
         tryngang(2)
    else
         for j:=1 downto 0 do
           if board[i-1, 1] >= mine[i-2,1]+j then
             begin
               mine[i,1]:= j;
               trydoc(i+1);
             end;
  end;

BEGIN
  init;
  input;
  trydoc(1);
  writeln('NO SOLUTION');
END.