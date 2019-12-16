const max = 100;
var n,i: longint;
    A: array [0..max] of byte;
BEGIN
  writeln ('Liet ke n nhi phan');
  write('n = '); readln(n);

  fillchar(A, sizeof(A),0);
  repeat
    for i:=1 to n do write(A[i]); writeln;     //in trang thai

    while (i>0) and (A[i]=1) do dec(i);        //kiem tra trang thai xem den 11..1  chua
    if i>0 then                                //chua thi gan 1 va 0 den cuoi
      begin
        A[i]:=1;
        fillchar(A[i+1],(n-1)*sizeof(A[1]),0);
      end;
  until i=0;
readln
END.
