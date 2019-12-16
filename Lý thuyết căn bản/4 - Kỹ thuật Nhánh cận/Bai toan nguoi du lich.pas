const fi = 'TOURISM.INP';
      fo = 'TOURISM.OUT';
      max = 100;
      maxC = max * 10000;

var C: array [0..max,0..max] of longint;
    x, best, t: array [0..max+1] of longint;
    free: array [1..max] of boolean;
    n,Min: longint;

procedure KhoiTao;
  var m,i,j,k: longint;
      f: text;
  begin
    assign (f,fi); reset(f); readln(f,n,m);

    for i:=1 to n do
      for j:=1 to n do
        if i = j then C[i,j]:=0 else C[i,j]:=maxC;

    for k:=1 to m do
      begin
        read(f,i,j,C[i,j]);
        C[j,i]:=C[i,j];
      end;

    close(f);

    fillchar (free,n,true);
    FREE[1]:=false;
    t[1]:=0;
    x[1]:=1;
    Min := maxC;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=2 to n do
      if free[j] then
        begin
          x[i]:=j;
          t[i]:=t[i-1] + C[x[i-1],j];
          if t[i] < Min then
            if i < n then
              begin
                free[j]:=false;
                try(i+1);
                free[j]:=true;
              end
            else
              if t[n] + C[x[n],1] < Min then
                begin
                  Min:= t[n] + C[x[n],1];
                  Best := x;
                end;
        end;
  end;

procedure out;
  var i: longint;
      f: text;
  begin
    assign (f,fo); rewrite(f);
    if Min = maxC then writeln (f,'No Solution')
    else for i:=1 to n do write (f,Best[i],'->');
    writeln (f,'1');
    writeln (f,'Cost: ',Min);
    close(f);
  end;

BEGIN
  KhoiTao;
  try(2);
  out;
END.