label l1;
const max = 100;
var i,j,k,n: longint;
    A: array [0..max] of longint;
    c:char;

procedure p1();
begin
  writeln ('Bai a');
  writeln ('Nhap n: '); readln(n);

  for k:=1 to n do
    begin
      for i:=1 to k do A[i]:=i;
      repeat
        write('{');
        for i:=1 to k-1 do write(A[i],',');
        writeln(A[k],'}');

       i:=k;
       while (i>0) and (A[i]=n-k+i) do dec(i);
       if i>0 then
         begin
           inc(A[i]);
           for j:=i+1 to k do A[j]:=A[j-1]+1;
         end;
      until i=0;
    end;
readln
end;

procedure p2();
begin
  writeln ('Bai b');
  writeln ('Nhap n: '); readln(n);

  fillchar(A,sizeof(A),0);
  repeat
    for i:=1 to n do write(A[i]); writeln;

    while (i>0) and (A[i]=1) do dec(i);
    if i>0 then
      begin
        A[i]:=1;
        fillchar(A[i+1],(n-1)*sizeof(A[1]),0);
      end;
  until i=0;

readln
end;

BEGIN
  WRITELN('Bai 5');
l1:
  writeln ('Chon a hay b?');
  readln(c);

  if c='a' then p1()
    else if c='b' then p2()
      else goto l1;
END.

