const max = 1000;
var n: longint;
    A,t: array [0..max] of longint;

procedure print(k: longint);
  var i: longint;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:= A[i-1] to (n-t[i-1]) div 2 do	//duyet cac so lon hon
      begin
        A[i]:=j;
        t[i]:=t[i-1] + j;		//tinh tong da phan tich
        try(i+1);
      end;
    A[i]:=n-t[i-1];			//Ptu cuoi cung
    print(i);
  end;

BEGIN
  write('n '); readln(n);

  A[0]:=1;
  t[0]:=0;

  try(1);

  readln
END.
