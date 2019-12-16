uses math;
const fi = 'KHONGAM.INP';
      fo = 'KHONGAM.OUT';
var f,g: text;
    a,fie: array [1..1000001] of longint;
    i,sum,n: longint;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);
    read(f,n);
    while n<>0 do
      begin
          sum:=0;
          for i:=1 to n do
            begin
                read(f,a[i]);
                inc(sum,a[i]);
                fie[n+1]:=min(fie[n+1], sum);
            end;
          if sum<0 then writeln(g,0)
          else begin
                   sum:=0;
                   for i:=n downto 1 do
                     begin
                         fie[i]:=min(fie[i+1]+a[i], a[i]);
                         if fie[i]>=0 then inc(sum);
                     end;
                   writeln(g,sum);
               end;
          read(f,n);
      end;
END.