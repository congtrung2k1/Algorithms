const max = 100;
var A: array [1..max] of boolean;                        //cot: j      //hang: i
    B: array [2..2*max] of boolean;                      //DB - TN    cheo chinh
    C: array [1-max..max-1] of boolean;                  //DN - TB    cheo phu
    x: array [0..max] of longint;
    n: longint;

procedure print;
  var j: longint;
  begin
    for j:=1 to n do write(x[j],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:= 1 to n do
      if (A[j] = false) and (B[i+j] = false) and (C[i-j] = false) then		//kt co trong hay khong
        begin
          x[i]:=j;		//nhan thu gtri
          if i = n then		//kt so luong
                        print
          else
                        begin
                          A[j]:=true; B[i+j]:=true; C[i-j]:=true;
                          try(i+1);
                          A[j]:=false; B[i+j]:=false; C[i-j]:=false;
                        end;
        end;
  end;

BEGIN
  write ('Nhap n: '); readln(n);

  try(1);

  readln
END.

























































