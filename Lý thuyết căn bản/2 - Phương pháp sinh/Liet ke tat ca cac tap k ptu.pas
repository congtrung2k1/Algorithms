const max = 100;
var n,k,j,i: longint;
    A: array [0..max] of byte;
BEGIN
  writeln ('Liet ke tap con k trong mang n ptu');
  write('n = '); readln(n);

  for k:=1 to n do
    begin
      for i:=1 to k do A[i]:=i;

      repeat
        write('{');
        for i:=1 to k-1 do write(A[i],',');
        writeln(A[k],'}');

        i:=k;
        while (i>0) and (A[i] = n-k+i) do dec(i);	//xet cuoi day xem dat gioi han chua
        if i>0 then
          begin
            inc(A[i]);
            for j:=i+1 to k do A[j]:=A[j-1]+1;	//gna cac gtri sau len 1 don vi
          end;
      until i=0;
    end;

readln
END.
