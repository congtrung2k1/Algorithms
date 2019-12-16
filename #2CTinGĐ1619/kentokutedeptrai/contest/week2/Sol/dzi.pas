uses math;
const fi = 'dzi.INP';
      fo = 'dzi.OUT';
var a,d,left,right,st: array [0..1001] of integer;
    m,n,i,j,ans,tmp,top,x: longint;
    f: text;

BEGIN
    assign(f,fi); reset(f);
    read(f,m,n);

    fillchar(d,sizeof(d),0);

    ans:=0;
    for i:=1 to m do
      begin
          for j:=1 to n do
            begin
                read(f,a[j]);
                if a[j] = 1 then d[j]:=i;
            end;

          d[0]:=1001; st[0]:=0; top:=0;
          for j:=1 to n do
              begin
                  while (top > 0) and (d[st[top]] <= d[j]) do dec(top);
                  inc(top);
                  st[top]:= j;
                  left[j]:= st[top-1];
              end;

          d[n+1]:=1001; st[0]:=n+1; top:=0;
          for j:=n downto 1 do
              begin
                  while (top > 0) and (d[st[top]] <= d[j]) do dec(top);
                  inc(top);
                  st[top]:=j;
                  right[j]:= st[top-1];
              end;

          for j:=1 to n do
            if a[j] = 0 then
              begin
                  tmp:=(i-d[j]) * (right[j]-left[j]-1);
                  ans:=max(ans, tmp);
              end;
      end;

    assign(f,fo); rewrite(f); writeln(f,ans); close(f);
END.