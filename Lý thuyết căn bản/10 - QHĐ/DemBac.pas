const fi = 'dembac.inp'; 
      fo = 'dembac.out';
var a: array [0..100000] of longint;
    free: array [0..100000] of boolean;
    n: longint;

procedure init;
  var f: text;
      i,j,k: longint;
  begin
    assign(f,fi); reset(f);
    readln(f,n,k);
    for i:=1 to k do
      begin
        read(f,j);
        free[j]:=true;
      end;
    close(f);
    fillchar(a,sizeof(a),0);
  end;

procedure xl;
  var i: longint;
  begin
    if free[n]=true then exit else a[1]:=1;
    for i:=2 to n do
      if free[i]=true then a[i]:=0
      else a[i]:=(a[i-1]+a[i-2]) mod 14062008;
  end;

procedure out;
  var f: text;
      i: longint;
  begin
    assign(f,fo); rewrite(f);
    writeln(f,a[n]); close(f);
  end;

BEGIN
  init;
  xl;
  out;
END.