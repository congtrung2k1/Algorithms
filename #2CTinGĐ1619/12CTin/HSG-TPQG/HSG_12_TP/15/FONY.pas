const fi = 'FONY.INP';
      fo = 'FONY.OUT';
var a: array [1..100000] of longint;
    free: array [1..100000] of boolean;
    n,i,j,dem: longint;
    f: text;
procedure init;
  var f: text;
      i: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n);
      for i:=1 to n do read(f,a[i]);
      close(f);
  end;

BEGIN
    init;
    assign(f,fo); rewrite(f);
    for i:=1 to n do
      begin
          fillchar(free,sizeof(free),true);
          free[i]:=false;
          dem:=1;
          j:=a[i];
          while free[j] do
            begin
                free[j]:=false;
                j:=a[j];
                inc(dem);
            end;
          writeln(f,dem);
      end;
    close(f);
END.