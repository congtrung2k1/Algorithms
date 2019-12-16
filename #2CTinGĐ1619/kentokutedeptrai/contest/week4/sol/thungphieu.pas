uses math;
const fi = 'thungphieu.inp';
      fo = 'thungphieu.out';

var f,g: text;
    ans,i,nmax,n,p: longint;
    sum: int64;
    a: array [1..500000] of longint;

function check(x: longint): boolean;
  var i,s: longint;
  begin
      check:=true;
      s:=0;
      for i:=1 to n do
        begin
            inc(s, a[i] div x);
            if a[i] mod x<>0 then inc(s);
            if s>p then exit(false);
        end;
      if x<ans then ans:=x;
      exit(true);
  end;

procedure solve(l,r: longint);
  var mid: longint;
  begin
      if l>r then exit;
      mid:=(l+r) div 2;
      if check(mid) then solve(l,mid-1) else solve(mid+1,r);
  end;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);
    while not(eof(f)) do
      begin
          read(f,n,p);
          if n=-1 then break;
          nmax:=0; sum:=0;
          for i:=1 to n do
            begin
                read(f,a[i]);
                nmax:=max(nmax,a[i]);
            end;
          ans:=nmax;
          solve(1,nmax);
          writeln(g,ans);
      end;
    close(G);
END.