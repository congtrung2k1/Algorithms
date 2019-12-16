const max = 1000;
type mang = array [0..max] of longint;
var A,B,C,x: mang;
    cuoib,daua,cuoic: longint;
    n,m,i,j: longint;

procedure print;
  var i: longint;
  begin
    for i:=1 to n  do write(x[i],' ');
    writeln;
  end;

function xuly(i: longint): boolean;
  var kiemtra: boolean ;
  begin
    if A[daua]=x[i] then
      begin
        inc(cuoic);
        C[cuoic]:=A[daua];
        inc(daua);
        if cuoic<n then kiemtra:=xuly(i+1) else begin print; xuly:=true; exit end;
        if kiemtra=true then exit;
      end
    else if B[cuoib]=x[i] then
           begin
             inc(cuoic);
             C[cuoic]:=B[cuoib];
             dec(cuoib);
             if cuoic<n then kiemtra:=xuly(i+1) else begin print; xuly:=true; exit end;
             if kiemtra=true then exit;
           end
         else
           begin
             while (A[daua] <> x[i]) and (daua<=n) do
               begin
                 inc(cuoib);
                 B[cuoib]:=A[daua];
                 inc(daua);
               end;
             if daua<=n then begin inc(cuoic); C[cuoic]:=A[daua]; inc(daua); end
             else
               begin xuly:=true; exit end;
             if cuoic<n then kiemtra:=xuly(i+1);
             if kiemtra=true then begin xuly:=true; exit; end;
           end;
  end;

procedure hoanvi(var x: mang);
  var i,k,a,b,t: longint;
  begin
    i:=n-1;
    while (x[i]>x[i+1]) and (i>0) do dec(i);
    if i>0 then
      begin
        k:=n;
        while x[i]>x[k] do dec(k);
        t:=x[i]; x[i]:=x[k]; x[k]:=t;

        a:=i+1; b:=n;
        while a<b do
          begin
            t:=x[a]; x[a]:=x[b]; x[b]:=t;
            inc(a); dec(b);
          end;
      end;
  end;

function kt: boolean;
  var i: longint;
  begin
    for i:=n-1 downto 2 do
      if x[i]<x[i+1] then exit(true);
    exit(false);
  end;

BEGIN
  writeln('Bai 2');
  write('Nhap n: '); readln(n);

  m:=1;
  for i:=1 to n do m:=m*i;
  for i:=1 to n do x[i]:=i;
  for j:=1 to m do
    begin
      daua:=1; cuoib:=0; B[cuoib]:=0; cuoic:=0; C[cuoic]:=0;
      for i:=1 to n do A[i]:=i;

      xuly(1);
      hoanvi(x);
    end;

  readln;
END.
