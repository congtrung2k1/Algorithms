var f: array [0..10000,0..9] of int64;
    x: array [0..10000] of longint;
    n,m,k,sl: longint;
    tmp: int64;

function tinh(i,last: longint): int64;
  var j: longint;
      re: int64;
  begin
      if i>m then
        begin
            inc(sl);
            if sl = k then
              begin
                  for j:=1 to m do write(x[j],' ');
                  halt;
              end;
            exit(1);
        end;

      if f[i,last]<>-1 then
        if f[i,last] + sl < k then
          begin
              inc(sl,f[i,last]);
              exit(sl);
          end;

      re:=0;
      for j:=x[i-1]+1 to n-m+i do
        begin
            x[i]:=j;
            re:= re + tinh(i+1, j);
        end;

      f[i,last]:=re;
      exit(re);
  end;

BEGIN
    read(n,m,k);
    fillchar(f,sizeof(f),255);
    sl:=0; x[0]:=0;
    tmp:=tinh(1,0);
    writeln(-1);
END.