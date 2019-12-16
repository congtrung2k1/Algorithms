const fi = 'CONNECT.INP';
var A: array [1..100,1..100] of boolean;
    kt: array [1..100] of boolean;
    n,m,i,j,k: longint;

procedure init;
  var f: text;
      u,v,m,i: longint;
  begin
    assign(f,fi); reset(f);
    read(f,n,m);

    for i:=1 to n do A[i,i]:=true;
    for i:=1 to m do
      begin
        read(f,u,v);
        A[u,v]:=true;
        A[v,u]:=true;
      end;
    close(f);
  end;

procedure try(i: longint);
  var j: longint;
  begin

  end;

BEGIN
  init;

  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to n do
        A[i,j]:=A[i,j] or (A[i,k] and A[k,j]);

  for i:=1 to n do
    begin
      if not kt[i] then
        begin
          writeln('Thanh phan lien thong: ');
          write(i,', ');
          kt[i]:=true;

          for j:=1 to n do
            if kt[j]=false then
              if A[i,j] then
                begin
                  write(j,', ');
                  kt[j]:=true;
                end;
        end;
      writeln;
    end;
  readln;
END.