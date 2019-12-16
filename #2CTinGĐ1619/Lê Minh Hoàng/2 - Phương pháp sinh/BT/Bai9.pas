const max = 100;
var n,i,j,k,dau,cuoi: longint;
    c: string;
    A: array [0..max] of char;
    x: array [0..max] of longint;

procedure hv(var x,y: longint);
  var t: longint;
  begin
    t:=x; x:=y; y:=t;
  end;

BEGIN
  c:='MISSISSIPPI';
  n:=length(c);
  for i:=1 to n do begin A[i]:=c[i]; x[i]:=i; end;

  repeat
    writeln;
    for i:=1 to n do write(A[x[i]]);

    i:=n-1;
    while (i>0) and (x[i]>x[i+1]) do dec(i);
    if i>0 then
      begin
        k:=n;
        while x[k] < x[i] do dec(k);
        hv(x[k],x[i]);

        dau:=i+1; cuoi:=n;
        while (dau<cuoi) do
          begin
            hv(x[dau],x[cuoi]);
            inc(dau); dec(cuoi);
          end;
      end;
  until i=0;

  readln;
END.
