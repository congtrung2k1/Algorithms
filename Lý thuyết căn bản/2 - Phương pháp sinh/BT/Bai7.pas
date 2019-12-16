const max=100;
var n,k,i,j,dau,cuoi: longint;
    A,B: array [0..max] of string;
    x: array [0..max] of longint;

procedure hv(var i,j: longint);
  var t: longint;
  begin
    t:=i; i:=j; j:=t;
  end;

BEGIN
  writeln('Bai 7');
  writeln('Nhap n: '); readln(n);

  writeln ('Danh sach ban nam:');
  for i:=1 to n do readln(A[i]);
  writeln ('Danh sach ban nu:');
  for i:=1 to n do readln(B[i]);

  for i:=1 to n do x[i]:=i;

  repeat
    writeln;
    for i:=1 to n do
      begin
        writeln(A[x[i]]);
        writeln(B[x[i]]);
      end;

    i:=n-1;
    while (i>0) and (x[i] > x[i+1]) do dec(i);
    if i>0 then
      begin
        k:=n;
        while (x[k]<x[i]) do dec(k);
        hv(x[i],x[k]);

        dau:=i+1; cuoi:=n;
        while (dau<cuoi) do
          begin
            hv (x[dau],x[cuoi]);
            inc(dau); dec(cuoi);
          end;
      end;
  until i=0;

  readln
END.
