uses math;

const FI = '';

var a: array [1..10000] of longint;
    q: array [1..100,1..100] of longint;
    f: text;
    n,m,i,j,k,smin: longint;

procedure init;
  var i,j: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n,m);
      for i:=1 to m do read(f,A[i]);
      for i:=1 to n do
        for j:=1 to n do read(f,q[i,j]);
  end;


BEGIN
    init;

    for i:=1 to n do
      for j:=1 to n do
        for k:=1 to n do
          q[j,k]:=min(q[j,k], q[j,i]+q[i,k]);

    smin:=0;
    for i:=2 to m do smin:=smin + q[a[i-1],a[i]];

    writeln(smin);
END.