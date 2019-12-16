const fi = 'strip.inp';
      fo = 'strip.out';

var f,g: text;
    a: array [0..62] of int64;
    n,k: longint;
    ans,tmp,slop: int64;

procedure build;
  var i: longint;
  begin
      a[0]:=1;
      for i:=1 to 62 do a[i]:=a[i-1]*2;
  end;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);
    build;

    while not eof(f) do
      begin
          read(f,k,n);

          ans:=1; tmp:=0; slop:=1;
          repeat
              if n<=a[k] div 2 then inc(tmp,slop)
              else begin
                       ans:=ans + tmp*2 + 1;
                       n:=a[k]-n+1;
                       tmp:=2*slop - ans;
                   end;
              slop:=slop*2;
              dec(k);
          until k=0;
          writeln(g,ans);
      end;
    close(g);
END.