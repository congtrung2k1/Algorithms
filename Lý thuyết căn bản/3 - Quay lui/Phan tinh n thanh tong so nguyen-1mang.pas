const max = 1000;
var n: longint;
    A: array [0..max] of longint;

procedure print(k: longint);
  var i: longint;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure try(i: longint);
  var j,x: longint;
  begin
    print(i);			//in cau hinh
    x:=A[i];			///xac nhan so du hien tai
    for j:= A[i-1] to x div 2 do		//duyet cac ptu co kha nang
      begin
        A[i]:=j;			//nhan thu
        A[i+1]:=x - j;	//xac nhan so du sau phan tich
        try(i+1);
      end;
  end;

BEGIN
  write('n '); readln(n);

  A[0]:=1;
  A[1]:=n;

  try(1);

  readln
END.
