const max = 10000;
var n,k: longint;
    A: array [0..max] of longint;
    kt: array [0..max] of boolean;

procedure print;
  var i: integer;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=1 to n do
      if kt[j] then			//kt lap
        begin
          A[i]:=j;
          if i=k then
                  print
          else
                  begin
                    kt[j]:=FALSE;	//danh dau
                    try(i+1);
                    kt[j]:=TRUE;	//bo danh dau
                  end;
        end;
  end;

BEGIN
  write ('Nhap n: '); readln(n);
  write ('Nhap k: '); readln(k);

  fillchar (kt,sizeof(kt),TRUE);
  try(1);

  readln
END.
