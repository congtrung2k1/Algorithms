var A: array [0..10000000] of longint;
    n,i,j,t: longint;
BEGIN
  readln(n);
  for i:=1 to n do readln(A[i]);

  i:=1; j:=2;                                                   // bat dau tu i, j la diem tiep theo
  while i<n do
    begin
      if A[i]>A[i+1] then                                       // so sanh so sau
        begin
          t:=A[i]; A[i]:=A[i+1]; A[i+1]:=t;
          dec(i);
          if i=0 then                                           // gioi han lui
            begin
              i:=j;                                             // nhan vi tri, tang j
              inc(j);
            end;
        end
      else begin
             i:=j;                                              // nhan vi tri, tang j
             inc(j);
           end;
    end;

  for i:=1 to n do write(A[i],' ');

END.
