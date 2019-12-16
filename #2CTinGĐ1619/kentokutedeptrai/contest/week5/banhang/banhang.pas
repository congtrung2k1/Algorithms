uses math;
const fi = 'banhang.inp';
      fo = 'banhang.out';
var i,j,n: longint;
    a: array [1..2000] of longint;
    f: array [0..2100,0..2100] of int64;

procedure init;
  var f: text; i: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n);
      for i:=1 to n do read(f,A[i]);
      close(f);
  end;

function tinh(l,r,d: longint): int64;
  begin
      if (l>r) or (d>n) then exit(0);
      if l=r then exit(a[l]*d);
      if f[l,r]<>-1 then exit(f[l,r]);
      f[l,r]:=max(a[l]*d + tinh(l+1,r,d+1) , a[r]*d + tinh(l,r-1,d+1));
      exit(f[l,r]);
  end;

procedure out;
  var f: text;
  begin
      assign(f,fo); rewrite(f); writeln(f,tinh(1,n,1)); close(f);
  end;

BEGIN
    init;
    fillchar(f,sizeof(f),255);
    out;
END.