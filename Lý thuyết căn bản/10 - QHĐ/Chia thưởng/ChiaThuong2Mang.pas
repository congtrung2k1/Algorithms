var c: array [0..10000,0..10000] of longint;
    m,n,i,j: longint;

BEGIN
  read(m,n);

  c[0,0]:=1;
  for i:=1 to m do c[i,0]:=0;

  for j:=1 to n do
    begin
      for i:=0 to j-1 do c[i,j]:=c[i,i];                         {so keo it hon do hoc sinh}
      for i:=j to m do c[i,j]:=c[i,j-1]+c[i-j,j];                  // so keo nhieu hon hs
    end;
  writeln(c[m,n]);
  readln;
END.
