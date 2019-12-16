const max = 1000;
type mang = array [0..max] of longint;
var A,B,C,x: mang;
    daua,daub,cuoib,cuoic,int: longint;
    s: string;
    n,i: longint;

procedure print;
  var i: longint;
  begin
    for i:=1 to n do write(x[i],' ');
    writeln;
  end;

function xuly(i: longint): boolean;
  var kiemtra: boolean;
  begin
    if A[daua]=x[i] then
      begin
        inc(cuoic); C[cuoic]:=A[daua];
        inc(daua);
        if cuoic<n then kiemtra:=xuly(i+1) else begin print; exit(true); end;
        if kiemtra then exit(true);
      end
    else if B[daub]=x[i] then
           begin
             inc(cuoic); C[cuoic]:=B[daub];
             inc(daub);
             if cuoic<n then kiemtra:=xuly(i+1) else begin print; exit(true); end;
             if kiemtra then exit(true);
           end
         else
           begin
             while (daua<=n) and (A[daua]<>x[i]) do
               begin
                 inc(cuoib); B[cuoib]:=A[daua];
                 inc(daua);
               end;
             if daua<=n then
               begin inc(cuoic); C[cuoic]:=A[daua]; inc(daua); end
             else exit(true);
             if cuoic<n then kiemtra:=xuly(i+1);
             if kiemtra then exit(true);
           end;
  end;

function kt: boolean;
  var i: longint;
  begin
    for i:=n-1 downto 1 do
      if x[i]<x[i+1] then exit(true);
    exit(false);
  end;

procedure hoanvi(var x:mang);
  var i,k,a,b,t: longint;
  begin
    i:=n-1;
    while (x[i]>x[i+1]) and (i>0) do dec(i);
    if i>0 then
      begin
        k:=n;
        while x[k]<x[i] do dec(k);
        t:=x[k]; x[k]:=x[i]; x[i]:=t;

        a:=i+1; b:=n;
        while a<b do
          begin
            t:=x[a]; x[a]:=x[b]; x[b]:=t;
            inc(a); dec(b);
          end;
      end;
  end;

BEGIN
  writeln('Bai 2c');
  write('Nhap n: '); readln(n);

  for i:=1 to n do x[i]:=i;
  for i:=1 to n do A[i]:=i;
  while kt do
    begin
      daua:=1; daub:=1; cuoib:=0; cuoic:=0; int:=0;
      xuly(1);
      hoanvi(x);
    end;

  readln;
END.
