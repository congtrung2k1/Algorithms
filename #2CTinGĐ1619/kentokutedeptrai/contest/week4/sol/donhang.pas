uses math;
const fi = '';
      fo = '';
var a: array [1..1000] of longint;
    n,d,m,ans: longint;

procedure init;
  var f: text; i,x: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n,d,m);
      for i:=1 to m do
        begin
            read(f,x);
            inc(a[x]);
        end;
  end;

procedure out;
  var f: text;
  begin
      assign(f,fo); rewrite(f); writeln(f,ans); close(f);
  end;

function check(m: longint): boolean;
  var tmp: array [1..1000] of longint;
      i,j,k: longint;
  begin
      j:=1; tmp:=a;
      for i:=1 to n do
        begin
            k:=m;
            if i-j>d then exit(false);
            while tmp[j]<=k do
              begin
                  dec(k,tmp[j]);
                  tmp[j]:=0;
                  inc(j);
                  if j>i then break;
              end;
            if j<=i then dec(tmp[j],k);
        end;
      if tmp[n-d]<>0 then exit(false);
      ans:=min(ans,m);
      exit(true);
  end;

procedure solve(l,r: longint);
  var mid: longint;
  begin
      if l>r then exit;
      mid:=(l+r) div 2;
      if check(mid) then
         solve(l,mid-1) else solve(mid+1,r);
  end;

BEGIN
    init;
    ans:=maxlongint;
    solve(1,m);
    out;
END.