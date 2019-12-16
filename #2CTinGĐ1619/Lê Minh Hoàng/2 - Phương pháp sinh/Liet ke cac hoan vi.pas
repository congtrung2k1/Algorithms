const max = 100;
var n,k,i,dau,cuoi: longint;
    A: array [0..max] of longint;

procedure hv(var a,b: longint);
  var t: longint;
  begin
    t:=a; a:=b; b:=t;
  end;

BEGIN
  writeln ('Liet ke cac hoan vi');
  write('n = '); readln(n);

  for i:=1 to n do A[i]:=i; // khoi tao

  repeat
    for i:=1 to n do write(A[i]); writeln; //in

    i:=n-1;	//ke cuoi
    while (i>0) and (A[i]>A[i+1]) do dec(i);	//tim day con giam dan tu cuoi
    if i>0 then	//neu co
      begin
        k:=n;
        while A[k] < A[i] do dec(k);	//tim ptu lon hon A[i] tu cuoi
        hv(A[k],A[i]);	//doi cho

        dau:=i+1; cuoi:=n;	// dao day i+1..n thanh day nho..lon
        while (dau<cuoi) do
          begin
            hv(A[dau],A[cuoi]);
            inc(dau); dec(cuoi);
          end;
      end;
  until i=0;

readln
END.
